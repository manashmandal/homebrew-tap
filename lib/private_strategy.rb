require "download_strategy"

class GitHubPrivateRepositoryDownloadStrategy < CurlDownloadStrategy
  def initialize(url, name, version, **meta)
    super
    parse_url_pattern
    set_github_token
  end

  def parse_url_pattern
    url_pattern = %r{https://github.com/([^/]+)/([^/]+)/releases/download/([^/]+)/(\S+)}
    unless @url =~ url_pattern
      raise CurlDownloadStrategyError, "Invalid url pattern for GitHub Release."
    end

    _, @owner, @repo, @tag, @filename = *@url.match(url_pattern)
  end

  def download_url
    "https://api.github.com/repos/#{@owner}/#{@repo}/releases/assets/#{asset_id}"
  end

  def _fetch(url:, resolved_url:, timeout:)
    curl_download download_url, "--header", "Authorization: token #{@github_token}", "--header", "Accept: application/octet-stream", to: temporary_path
  end

  private

  def set_github_token
    @github_token = ENV["HOMEBREW_GITHUB_API_TOKEN"]
    unless @github_token
      raise CurlDownloadStrategyError, "Environmental variable HOMEBREW_GITHUB_API_TOKEN is required."
    end
  end

  def asset_id
    @asset_id ||= resolve_asset_id
  end

  def resolve_asset_id
    release_metadata = fetch_release_metadata
    assets = release_metadata["assets"].select { |a| a["name"] == @filename }
    raise CurlDownloadStrategyError, "Asset not found: #{@filename}" if assets.empty?

    assets.first["id"]
  end

  def fetch_release_metadata
    require "json"

    release_url = "https://api.github.com/repos/#{@owner}/#{@repo}/releases/tags/#{@tag}"
    output, = curl_output "--header", "Authorization: token #{@github_token}", "--header", "Accept: application/vnd.github.v3+json", release_url

    JSON.parse(output)
  end
end

class GitHubPrivateRepositoryArchiveDownloadStrategy < CurlDownloadStrategy
  def initialize(url, name, version, **meta)
    token = ENV["HOMEBREW_GITHUB_API_TOKEN"]
    raise CurlDownloadStrategyError, "HOMEBREW_GITHUB_API_TOKEN is required." unless token

    meta[:headers] = Array(meta[:headers]) + [
      "Authorization: token #{token}",
      "Accept: application/vnd.github.v3+json",
    ]
    super(url, name, version, **meta)
  end
end

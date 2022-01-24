class GithubClient

  ACCESS_TOKEN = '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'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    result = @http_client.create_gist(params.to_json)
  rescue StandardError
    false
  else
    result
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end

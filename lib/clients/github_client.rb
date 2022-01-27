class GithubClient

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
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end
end

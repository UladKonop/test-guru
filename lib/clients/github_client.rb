class GithubClient

  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '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'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('/gists') do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end

end

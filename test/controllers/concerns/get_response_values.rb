module GetResponseValues
  extend ActiveSupport::Concern

  def json_response
    (ActiveSupport::JSON.decode @response.body).deep_symbolize_keys
  end

  def response_headers
    @response.headers
  end

  def response_x_auth_header
    @response.headers["X-Auth-Token"]
  end
end
require 'httparty'

class MacbethProxy
  MACBETH_URL = "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"

  attr_reader :macbeth_url

  def initialize macbeth_url = nil
    @macbeth_url = (macbeth_url.nil?) ? MACBETH_URL : macbeth_url
  end

  def get
    response = HTTParty.get(@macbeth_url)
    OpenStruct.new(status_code: response.code, body: response.body)
  end
end

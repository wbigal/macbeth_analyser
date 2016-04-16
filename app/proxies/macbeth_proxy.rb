require 'httparty'

class MacbethProxy
  MACBETH_URL = "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"

  def get
    response = HTTParty.get(MACBETH_URL)
    OpenStruct.new(status_code: response.code, body: response.body)
  end
end

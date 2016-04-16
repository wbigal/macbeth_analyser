require 'spec_helper'

describe MacbethProxy do
  let(:macbeth_proxy) { MacbethProxy.new }
  let(:xml) { File.new('./spec/fixtures/macbeth.xml').read }

  context '#get' do
    it 'success' do
      result = macbeth_proxy.get
      expect(result).to have_attributes(status_code: 200, body: xml)
    end
  end
end

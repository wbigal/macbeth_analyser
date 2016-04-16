require 'spec_helper'

describe MacbethAnalyserService do
  let(:macbeth_analyser_service) { MacbethAnalyserService.new }

  context '#speakers' do
    it 'count' do
      result = macbeth_analyser_service.speakers
      expect(result).to eq({
        "SERGEANT"=>52,
        "BANQUO"=>19,
        "DUNCAN"=>12,
        "MALCOLM"=>10,
        "MACBETH"=>4,
        "FLEANCE"=>2
      })
    end

    it 'not found' do
      macbeth_proxy = MacbethProxy.new('http://www.ibiblio.org/not_found')
      macbeth_analyser_service.instance_variable_set(:@macbeth_proxy, macbeth_proxy)

      expect {
        macbeth_analyser_service.speakers
      }.to raise_error(MacbathNotFoundError)
    end
  end
end

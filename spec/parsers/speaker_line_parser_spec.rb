require 'spec_helper'
require 'xmlsimple'

describe SpeakerLineParser do
  let(:speaker_line_parser) { SpeakerLineParser.new }

  context '#to_counter' do
    it 'parser an empty doc' do
      result = speaker_line_parser.to_counter({})
      expect(result).to be_an_instance_of(SpeakerLineCounter)
      expect(result.length).to be(0)
    end

    it 'a lot of lines' do
      file = File.open('./spec/fixtures/macbeth.xml')
      data  = XmlSimple.xml_in(file)

      result = speaker_line_parser.to_counter(data)
      expect(result).to be_an_instance_of(SpeakerLineCounter)
      expect(result.length).to be(6)
      expect(result.get('DUNCAN')).to be(12)
      expect(result.get('MALCOLM')).to be(10)
      expect(result.get('MACBETH')).to be(4)
      expect(result.get('Sergeant')).to be(52)
      expect(result.get('BANQUO')).to be(19)
      expect(result.get('FLEANCE')).to be(2)
      expect(result.get('ALL')).to be_nil
    end
  end
end

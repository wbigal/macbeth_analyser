require 'spec_helper'

describe SpeakerLineCounter do
  context '#add' do
    let(:speaker_line_counter) { SpeakerLineCounter.new }
    let(:total_lines) { 50 }
    let(:speaker) { 'DUNCAN' }
    it 'valid key and total lines' do
      result = speaker_line_counter.add(speaker, total_lines)
      expect(result).to eq(total_lines)

      result = speaker_line_counter.add(speaker.downcase, total_lines)
      expect(result).to eq(total_lines * 2)
    end
    it 'invalid total lines' do
      total_lines = -50
      result = speaker_line_counter.add(speaker, total_lines)
      expect(result).to eq(0)
    end
    it 'blank key' do
      speaker = ''
      expect {
        speaker_line_counter.add(speaker, total_lines)
      }.to raise_error(InvalidKeyError, 'The key can not be nil or blank.')
    end
    it 'nil key' do
      speaker = nil
      expect {
        speaker_line_counter.add(speaker, total_lines)
      }.to raise_error(InvalidKeyError, 'The key can not be nil or blank.')
    end
  end
end

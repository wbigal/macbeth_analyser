require 'spec_helper'

describe SpeakerLineCounter do
  let(:speaker_line_counter) { SpeakerLineCounter.new }

  context '#add' do
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

  context '#sorted_by_lines' do
    it 'empty list' do
      result = speaker_line_counter.sorted_by_lines
      expect(result).to eq({})
    end

    it 'return sorted list' do
      speaker_line_counter.add('A', 10)
      speaker_line_counter.add('B', 5)
      speaker_line_counter.add('C', 3)
      speaker_line_counter.add('D', 40)

      result = speaker_line_counter.sorted_by_lines
      expect(result).to eq({
        'D' => 40,
        'A' => 10,
        'B' => 5,
        'C' => 3
        })
    end
  end

  context '#length' do
    it 'empty list' do
      expect(speaker_line_counter.length).to eq(0)
    end

    it 'a lot of items' do
      speaker_line_counter.add('A', 10)
      speaker_line_counter.add('B', 5)
      speaker_line_counter.add('C', 3)
      speaker_line_counter.add('D', 40)

      expect(speaker_line_counter.length).to eq(4)
    end
  end

  context '#get' do
    let(:speaker) { 'DUNCAN' }
    let(:total_lines) { 50 }

    it 'empty list' do
      expect(speaker_line_counter.get(speaker)).to be_nil
    end

    it 'get item' do
      speaker_line_counter.add(speaker, total_lines)
      expect(speaker_line_counter.get(speaker)).to eq(total_lines)
    end
  end
end

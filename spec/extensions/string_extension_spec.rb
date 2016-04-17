require 'spec_helper'

describe String do
  context '#humanize' do
    it 'success' do
      expect('SPORT CLUB CORINTHIANS PAULISTA 1910'.humanize).to eq('Sport Club Corinthians Paulista 1910');
    end

    it 'blank' do
      expect(''.humanize).to eq('');
    end
  end
end

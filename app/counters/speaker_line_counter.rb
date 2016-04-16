class SpeakerLineCounter
  IGNORED_SPEAKERS = [ 'ALL' ]

  attr_reader :speakers

  def initialize
    @speakers = Hash.new(0)
  end

  def add key, total
    return 0 if (total <= 0)
    normalized_key = normalize_key(key)
    return nil if (ignored_speaker(key))
    @speakers[normalized_key] += total
  end

  def get key
    normalized_key = normalize_key(key)
    return nil unless (@speakers.key?(normalized_key))
    @speakers[normalized_key]
  end

  def sorted_by_lines
    return @speakers if (@speakers.empty?)
    @speakers.sort_by { |key, value| value  }.to_h
  end

  def length
    @speakers.length
  end

  private
    :speakers

    def normalize_key(key)
      raise InvalidKeyError.new() if (key.nil? || key.empty?)
      key.upcase
    end

    def ignored_speaker(speaker)
      IGNORED_SPEAKERS.include?(speaker)
    end
end

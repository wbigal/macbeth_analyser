class SpeakerLineCounter
  attr_reader :speakers

  def initialize
    @speakers = Hash.new(0)
  end

  def add key, total
    return 0 if (total <= 0)
    normalized_key = normalize_key(key)
    @speakers[normalized_key] += total
  end

  private
    :speakers

    def normalize_key(key)
      raise InvalidKeyError.new() if (key.nil? || key.empty?)
      key.upcase
    end
end

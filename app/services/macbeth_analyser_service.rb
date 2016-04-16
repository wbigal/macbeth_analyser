class MacbethAnalyserService

  attr_reader :macbeth_proxy
  attr_reader :speaker_line_parser

  private :macbeth_proxy, :speaker_line_parser

  def initialize
    @macbeth_proxy = MacbethProxy.new
    @speaker_line_parser = SpeakerLineParser.new
  end

  def speakers
    response = @macbeth_proxy.get
    raise MacbathNotFoundError.new if (response.status_code != 200)

    speaker_line_counter = @speaker_line_parser.to_speaker_line_counter(response.body)
    speaker_line_counter.sorted_by_lines
  end
end

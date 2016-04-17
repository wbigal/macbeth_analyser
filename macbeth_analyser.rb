Dir[File.dirname(__FILE__) + "/app/**/*.rb"].each { |file| load file }

macbeth_analyser_service = MacbethAnalyserService.new
macbeth_analyser_service.speakers.each do |key, value|
  puts "#{"%03d" % value} #{key.humanize}"
end

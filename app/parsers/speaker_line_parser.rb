require 'xmlsimple'

class SpeakerLineParser
  def to_speaker_line_counter doc
    speaker_line_counter = SpeakerLineCounter.new
    return speaker_line_counter if (doc.nil? || doc.empty?)

    doc_hash = XmlSimple.xml_in(doc)

    doc_hash["ACT"].each do |ect|
      ect["SCENE"].each do |scene|
        scene["SPEECH"].each do |speech|
          speaker_line_counter.add(speech["SPEAKER"].first, speech["LINE"].length)
        end
      end
    end

    speaker_line_counter
  end
end

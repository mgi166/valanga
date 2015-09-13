module Valanga
  class PlayList
    def initialize(document)
      @document  = Nokogiri::HTML.parse(document, nil, 'Shift_JIS')
      @play_list = @document.css("#mybest_list tr")[1..-1]
    end

    attr_reader :document, :play_list

    def music_ids
      @music_ids ||= play_list.map do |list|
        value = list.css("a").attr("onclick").value
        $1 if value =~ /id=([\w%]+)/
      end
    end
  end
end

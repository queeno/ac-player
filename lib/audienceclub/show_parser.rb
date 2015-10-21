require 'audienceclub/show'

module AudienceClub
  class ShowParser

    attr_accessor :shows_page

    def initialize(shows_page)
      @shows_page = shows_page
    end

    def get_info(attribute)
      return @shows_page.search(".#{attribute}")
    end

    def build_shows

      # Extract info from shows_page
      titles = get_info('showtitle')
      #genres = get_info('genre')
      descriptions = get_info('showdescription')
      venues = get_info('venue')
      dates = get_info('dateTime')

      if titles.length == 0
        raise "No shows to iterate"
      end

      # Create shows array
      shows = Array.new(titles.length).fill { |elem| Show.new }

      shows.each do |show|
        show.title = titles.shift.text.strip.split(/\r?\n/)[0].strip
        #show.genre = genres.shift.text
        show.description = descriptions.shift.text.strip
        theatre_postcode = venues.shift.text.strip.split(/\r?\n/)
        show.theatre = theatre_postcode[0].strip
        show.postcode = theatre_postcode[1].strip
        date_time = dates.shift.text.strip.split(/\r?\n/)[0].strip.gsub('Shows from ','')
        show.date_time = DateTime.parse(date_time)
        date_time.include?('Waitlist Only') ? show.waitlist = true : show.waitlist = false
        date_time.include?('Sold Out') ? show.soldout = true : show.soldout = false
      end

      shows.each { |d| puts "#{d.title} @ #{d.theatre}" }
    end
  end
end

require 'crawler/login'
require 'audienceclub/show_parser'

class App

  def run
    login = Crawler::Login.new
    shows_page = login.run
    show_parser = AudienceClub::ShowParser.new(shows_page)
    show_parser.build_shows
  end

end

require 'crawler/login'
require 'audienceclub/show_parser'
require 'tools/logger'

class App

  def initialize
    @logger = Tools::Logger.instance
  end

  def run
    @logger.info "Starting app..."
    login = Crawler::Login.new
    shows_page = login.run
    show_parser = AudienceClub::ShowParser.new(shows_page)
    show_parser.build_shows
  end

end

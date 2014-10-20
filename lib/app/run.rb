require 'crawler/login'
require 'audienceclub/show_parser'

module App

  extend self

  def run
    login = Crawler::Login.new

    shows_page = login.do_login

    show_parser = AudienceClub::ShowParser.new
    show_parser.shows_page = shows_page
    show_parser.build_shows
  end

end

App.run

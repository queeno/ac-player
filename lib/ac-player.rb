require 'crawler/login'
require 'audienceclub/show_parser'
require 'tools/logger'
require 'context/context'

class App

  def initialize
    @logger = Tools::Logger.instance
    @context = Context::Context.new
  end

  def run
    @logger.info "Starting app..."
    @context.run

    #login = Crawler::Login.new
    #shows_page = login.run
    #show_parser = AudienceClub::ShowParser.new(shows_page)
    #show_parser.build_shows
  end

end

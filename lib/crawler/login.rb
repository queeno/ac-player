#!/usr/bin/env ruby

require 'crawler/browser'
require 'crawler/config'
require 'tools/logger'
require 'tools/exceptions'

module Crawler

  class Login

    def initialize
      @logger = Tools::Logger.instance
    end

    def skip_announce_pages
      begin
        @current_page.forms.each do |form|
          if form.button_with(:value => /Click Here/)
            @logger.info 'Skipping welcome page...'
            @current_page = form.click_button
          else
            @logger.error "Exception: Can't find the 'Click here' button to click in announce page"
            raise Tools::NoButtonInWelcomePage
          end
        end
      end until @current_page.link_with(:text => /Theatre Ladder/)
      @logger.info 'Landed on the shows page!'
    end

    def logged_in_already?
      @logger.info 'Determining if user was already logged in...' 

      if @current_page.nil?
        @logger.info 'User was never logged in.'
        return false
      end
      
      ac_ladder_full_url = "#{Crawler::AC_LOGIN_URL}#{Crawler::AC_THEATRE_LADDER_PATH}"
      @current_page = Crawler.browser.get(ac_ladder_full_url)

      if @current_page.link_with(:text => /Theatre Ladder/)
        @logger.info 'User was already logged in.'
        return true
      else
        @logger.info 'User was not logged in.'
        return false
      end
    end

    def do_login
      # Get a login page
      @logger.info "Opening webpage #{Crawler::AC_LOGIN_URL}"
      @current_page = Crawler.browser.get(Crawler::AC_LOGIN_URL)

      # Get a login form
      login_form = @current_page.form_with(:name => /login/)

      # Set the login fields
      @logger.info 'Filling the login form' 
      login_form.field_with(:type => /email/).value = Crawler::EMAIL
      login_form.field_with(:type => /password/).value = Crawler::PASSWD

      # Hit submit and return next page
      @current_page = login_form.click_button
      @logger.info "Submitted login form."

    end

    def run
      if not logged_in_already?
        do_login
        skip_announce_pages
      end
      @current_page
    end

    private :do_login, :skip_announce_pages, :logged_in_already?

  end

end

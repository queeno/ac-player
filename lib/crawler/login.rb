#!/usr/bin/env ruby

require 'crawler/browser'
require 'crawler/config'

module Crawler

  class Login

    def skip_announce_pages
      begin
        @current_page.forms.each do |form|
          if form.button_with(:value => /Click Here/)
            @current_page = form.click_button
          else
            raise "Exception: Can't find 'Click here' button to click in announce page"
          end
        end
      end until @current_page.link_with(:text => /Theatre Ladder/)
    end

    def do_login
      # Get a login page
      @current_page = Crawler.browser.get(Crawler::AC_LOGIN_URL)

      # Get a login form
      login_form = @current_page.form_with(:name => /login/)

      # Set the login fields
      login_form.field_with(:type => /email/).value = Crawler::EMAIL
      login_form.field_with(:type => /password/).value = Crawler::PASSWD

      # Hit submit and return next page
      @current_page = login_form.click_button

    end

    def run
      do_login
      skip_announce_pages

      @current_page
    end

  private :do_login, :skip_announce_pages

  end

end

#!/usr/bin/env ruby

require 'crawler/browser'
require 'crawler/config'

module Crawler

  class Login

    def do_login
      # Get a login page
      login_page = Crawler.browser.get(Crawler::AC_LOGIN_URL)

      # Get a login form
      login_form = login_page.form_with(:name => /login/)

      # Set the login fields
      login_form.field_with(:type => /email/).value = Crawler::EMAIL
      login_form.field_with(:type => /password/).value = Crawler::PASSWD

      # Hit submit
      welcome_page = login_form.click_button

      # Click continue
      return welcome_page.form.click_button
    end

  end

end

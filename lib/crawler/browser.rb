#!/usr/bin/env ruby

begin
    require 'mechanize'
rescue LoadError
    puts 'Please gem install mechanize'
    puts 'Also make sure your RUBYOPT env variable is set to \'rubygem\''
end

module Crawler
  # Get browser
  @@browser = Mechanize.new

  def self.browser
    @@browser
  end

end

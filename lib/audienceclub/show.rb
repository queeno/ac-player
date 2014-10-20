#!/usr/bin/env ruby

module AudienceClub
  class Show
    attr_accessor :title, :genre, :theatre, :postcode, :description, :date_time
    attr_accessor :waitlist, :soldout
  end
end

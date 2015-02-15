#!/usr/bin/env ruby

require 'singleton'

module Tools

  class Logger

    include Singleton

    attr_reader :output

    def initialize
      @output = Array.new
    end

    def error(message)
      output << formatted_message(message, 'ERROR')
    end

    def info(message)
      output << formatted_message(message, 'INFO')
    end

    def write
      puts output
    end

    def formatted_message(message, type)
      "#{Time.now} | #{type}: #{message}\n"
    end

  end
end

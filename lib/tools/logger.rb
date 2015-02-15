#!/usr/bin/env ruby

require 'singleton'

module Tools

  class Logger

    include Singleton

    def error(message)
      write formatted_message(message, 'ERROR')
    end

    def info(message)
      write formatted_message(message, 'INFO')
    end

    def write(output)
      puts output
    end

    def formatted_message(message, type)
      "#{Time.now} | #{type}: #{message}\n"
    end

  end
end

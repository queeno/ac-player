#!/usr/bin/env ruby

require 'optparse'
require 'tools/logger'

module Context

  class Context
    
    def initialize
      @logger = Tools::Logger.instance
      @options = {}
      @opt_parser = nil
    end

    def print_helper
      puts "Never miss a show on the Audience Club ladder!"
      puts "The ac-player will alert you when a show you like becomes available"
      puts
      puts @opt_parser.to_s
    end

    def build_options
      @opt_parser = OptionParser.new do |opts|
        opts.banner = 'Usage: ac-player [OPTIONS]'

        @options[:daemon] = false
        opts.on('-d','--daemon','Run program as daemon') do |d|
          @options[:daemon] = d
        end

        opts.on('-i','--interval TIME','Crawling interval in sec') do |i|
          @options[:interval] = i
        end
        
        opts.on('-h','--help','Print help') do |h|
          @options[:help] = h
        end

      end

      @opt_parser.parse!
    end

    def build_context
      begin
        build_options
      rescue OptionParser::MissingArgument => err
        @logger.error err.to_s
        puts "ERROR: #{err.to_s}"
        puts
        @options[:help] = true
        return 1
      end
    end

    def run
      build_context

      if @options[:help]
          print_helper
          return
      end

      if @options[:daemon]
      end

      puts @options
    end

    private :build_context, :build_options, :print_helper

  end

end

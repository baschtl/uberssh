require "uberssh/version"
require "uberssh/account"
require "uberssh/account_manager"
require "uberssh/app"

require 'optparse'
require 'ostruct'
require 'etc'
require 'yaml'

module Uberssh

  def self.run
    account_name = nil
  
    OptionParser.new do |opts|

      opts.banner     = "Uberssh"
      opts.define_head  "SSH to your uberspace"
      opts.separator    ""
      opts.separator    "Options:"

      opts.on_tail("--help", "Show this message") do
        puts opts
        puts "\nTo be written...\n\n"
        exit
      end

      opts.on_tail("-a", "--account ACCOUNTNAME", "Specify your account") do |name|
        account_name = name
      end

      begin
        opts.parse!
      rescue OptionParser::ParseError
        puts opts
        exit 1
      end

    end

    App.new(account_name: account_name).start
  end

end

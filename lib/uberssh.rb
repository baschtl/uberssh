require "uberssh/app"
require "uberssh/account"
require "uberssh/account_manager"
require "uberssh/version"

require 'optparse'
require 'etc'
require 'yaml'

module Uberssh

  def self.run
    account_name = nil
  
    OptionParser.new do |opts|
      opts.banner = "Uberssh"

      opts.define_head  "SSH to your Uberspace"
      opts.separator    ""
      opts.separator    "Options:"

      opts.on_tail("--help", "Show this message") do
        puts opts
        exit
      end

      opts.on_tail("-a", "--account ACCOUNTNAME", "Specify your Uberspace account.") do |name|
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

require "uberssh/version"
require "uberssh/account"
require "uberssh/account_manager"

require 'optparse'
require 'ostruct'
require 'etc'

module Uberssh

  def self.connect!
    options = OpenStruct.new
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

      opts.on_tail("-a", "--account ACCOUNTNAME", "Specify your account") do |a|
        # TODO
        options.account = a
      end

      begin
        opts.parse!
      rescue OptionParser::ParseError
        puts opts
        exit 1
      end

    end

    begin

      manager = AccountManager.new

      if options.account.nil?
        puts "\n============================================================="
        puts "            uberssh - ssh to your uberspace"
        puts "=============================================================\n"

        manager.accounts.each_with_index do |account, index|
          puts "[#{index + 1}] #{account.project}"
        end
        print "\n--> Please select account: "
        selected_index = gets.chomp.to_i
        options.account = manager.accounts[selected_index - 1]
      end

      system "clear"
      puts "Connecting to #{options.account.project}...\n"

      manager.ssh(options.account).each_line do |ssh|
        puts ssh
        puts "\n"
        exec ssh
      end

    rescue Exception => e
      puts e.message
    end

  end

end

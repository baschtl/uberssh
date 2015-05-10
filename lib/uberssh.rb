require "uberssh/version"
require "uberssh/account"
require "uberssh/account_manager"

require 'optparse'
require 'ostruct'
require 'etc'
require 'yaml'

module Uberssh

  def self.connect!
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

    begin
      manager          = AccountManager.new
      selected_account = nil

      unless account_name
        puts "\n============================================================="
        puts "            uberssh - ssh to your uberspace"
        puts "=============================================================\n"

        manager.print_accounts
        print "\n--> Please select account: "
        
        selected_index   = gets.chomp.to_i
        selected_account = manager.accounts[selected_index - 1]
        raise "The number you gave was not on the list." unless selected_account
      else
        selected_account = manager.account_from_name(account_name)
        raise "The given Uberspace account was not found." unless selected_account
      end

      system "clear"
      puts "Connecting to #{selected_account.project}...\n"

      manager.ssh(selected_account).each_line do |ssh|
        puts ssh
        puts "\n"
        exec ssh
      end

    rescue Exception => e
      puts e.message
    end

  end

end

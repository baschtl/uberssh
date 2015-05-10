module Uberssh

  class App

    def initialize(account_name: nil)
      @account_name = account_name
    end

    def start
      begin
        manager          = AccountManager.new
        selected_account = nil

        unless @account_name
          puts "\n============================================================="
          puts "            uberssh - ssh to your uberspace"
          puts "=============================================================\n"

          manager.print_accounts
          print "\n--> Please select account: "
          
          selected_index   = gets.chomp.to_i
          selected_account = manager.accounts[selected_index - 1]
          raise "The number you gave was not on the list." unless selected_account
        else
          selected_account = manager.account_from_name(@account_name)
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

end

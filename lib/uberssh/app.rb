module Uberssh

  class App

    def initialize(account_name: nil)
      @account_name = account_name
      @manager      = AccountManager.new
    end

    def start
      begin
        selected_account = nil

        unless @account_name
          selected_account = select_account
        else
          selected_account = @manager.account_from_name(@account_name)
          raise "The given Uberspace account was not found." unless selected_account
        end

        system "clear"

        puts "Connecting to #{selected_account.project}..."
        connect_via_ssh_to(selected_account)
      rescue Exception => e
        puts e.message
      end
    end

    private

    def select_account
      print_welcome_message
      @manager.print_accounts
      print "\n--> Please select an account: "
      
      selected_index   = gets.chomp.to_i
      selected_account = @manager.accounts[selected_index - 1]
      raise "The number you gave was not on the list." unless selected_account

      selected_account
    end

    def print_welcome_message
      puts "\n============================================================="
      puts "            uberssh - ssh to your uberspace"
      puts "=============================================================\n"
    end

    def connect_via_ssh_to(account)      
      ssh = ssh_command(account)
      puts "#{ssh}"
      exec ssh
    end

    def ssh_command(account)
      "ssh -l #{account.name} #{account.hostname} -i #{account.ssh_key}"
    end

  end

end

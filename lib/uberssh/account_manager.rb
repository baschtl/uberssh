module Uberssh

  class AccountManager

    CONFIG_FILE = Etc.getpwuid.dir. + '/.uberssh'

    def initialize
      @accounts = []
    end

    def accounts
      load_accounts if @accounts.empty?

      @accounts
    end

    def account_from_name(name)
      accounts.detect { |a| a.name == name }
    end

    def print_accounts
      accounts.each_with_index do |account, index|
        puts "[#{index + 1}] #{account.project}"
      end
    end

    private

    def load_accounts
      raise "No uberssh configuration found in #{CONFIG_FILE}." unless File.exist?(CONFIG_FILE)

      config = YAML.load_file(CONFIG_FILE)['accounts']
      config.each_pair do |k ,v|
        @accounts << Account.new(k, v)  
      end
    end

  end

end

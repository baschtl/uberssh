require 'yaml'

module Uberssh

  class AccountManager

    CONFIG_FILE = Etc.getpwuid.dir. + '/.uberssh'

    def initialize
      @accounts = []
    end

    def accounts
      raise "No uberssh configuration found in #{CONFIG_FILE}." unless File.exist?(CONFIG_FILE)
      load_accounts if @accounts.empty?

      @accounts
    end

    def ssh(account)
      raise "Unknown Uberspace account." unless account
      "ssh -l #{account.name} #{account.hostname} -i #{account.ssh_key}"
    end

    private

    def load_accounts
      config = YAML.load_file(CONFIG_FILE)['accounts']
      config.each_pair do |k ,v|
        @accounts << Account.new(k, v)  
      end
    end

  end

end

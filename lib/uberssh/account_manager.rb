require 'yaml'

module Uberssh

  class AccountManager

    def self.accounts
      raise "No uberssh configuration found in #{config}" unless File.exist?(config)
      YAML.load_file(config)['accounts']
    end

    def self.ssh(name)
      a = account(name)
      raise "Unknown Uberspace account '#{name}'" if a.nil?
      "ssh -l #{name} #{a['hostname']} -i #{a['ssh-key']}"
    end

    def self.account(name)
      accounts[name]
    end

    def self.config
      Etc.getpwuid.dir. + "/.uberssh"
    end

  end

end

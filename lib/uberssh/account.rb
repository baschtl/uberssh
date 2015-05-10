module Uberssh

  class Account

    VALID_OPTIONS = %w( project hostname ssh_key )

    attr_accessor :name, :project, :hostname, :ssh_key

    def initialize(name, options = {})
      @name = name

      filtered_options(options).each do |k, v|
        send("#{k}=", v)
      end
    end

    private

    def filtered_options(options)
      options.select { |k, _| VALID_OPTIONS.include?(k) }
    end

  end

end

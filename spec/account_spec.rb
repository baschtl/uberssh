require 'spec_helper'

describe Uberssh::Account do

  context "when initializing" do

    let(:name)     { 'donald' }
    let(:project)  { 'ducktales' }
    let(:hostname) { 'duckburg' }
    let(:ssh_key)  { '~/.ssh/duckburg_rsa' }

    subject { described_class.new(name, options) }

    context "with proper options" do

      let(:options)  { { project: project, hostname: hostname, ssh_key: ssh_key } }

      its(:name)      { eq name }
      its(:project)   { eq project }
      its(:hostname)  { eq hostname }
      its(:ssh_key)   { eq ssh_key}

    end

    context "with not supported options" do

      let(:options)  { { project: project, hostname: hostname, ssh_key: ssh_key, something: 'dagobert' } }

      its(:name)      { eq name }
      its(:project)   { eq project }
      its(:hostname)  { eq hostname }
      its(:ssh_key)   { eq ssh_key}

    end

  end

end

require 'spec_helper'

describe Uberssh::AccountManager do

  before :each do
    allow_any_instance_of(described_class)
      .to receive(:config_file)
      .and_return(File.expand_path('.spec_uberssh', 'spec/fixtures'))
  end

  describe "#accounts" do

    subject { described_class.new.accounts }

    it 'loads the accounts' do
      expect(subject.size).to eq(2)
    end

  end

  describe "#account_from_name" do

    subject { described_class.new.account_from_name('foo') }

    its(:name)      { eq 'foo' }
    its(:project)   { eq 'My Foo' }
    its(:hostname)  { eq 'cepheus.uberspace.de' }
    its(:ssh_key)   { eq '~/.ssh/uberspace_rsa' }

  end

end

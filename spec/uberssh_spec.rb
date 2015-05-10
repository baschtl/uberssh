require 'spec_helper'

describe Uberssh do

  it 'has a version number' do
    expect(Uberssh::VERSION).not_to be nil
  end

  describe ".run" do

    subject { Uberssh.run }

    it "creates a new App" do
      expect(Uberssh::App).to receive(:new).once.and_return(double('app', start: true))

      subject
    end

    it "starts the App" do
      expect_any_instance_of(Uberssh::App).to receive(:start).once

      subject
    end

  end

end

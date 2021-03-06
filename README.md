# Uberssh

[![Tag](https://img.shields.io/github/tag/baschtl/uberssh.svg?style=flat-square)](https://github.com/baschtl/uberssh/releases) [![Build Status](https://img.shields.io/travis/baschtl/uberssh.svg?style=flat-square)](https://travis-ci.org/baschtl/uberssh) [![Code Climate](https://img.shields.io/codeclimate/github/baschtl/uberssh.svg?style=flat-square)](https://codeclimate.com/github/baschtl/uberssh)

Uberssh is a script to select to which of your [Uberspaces](https://uberspace.de/) you want to connect to via ssh in just a few key strokes.

The script was initially written by [pixelpogo](https://github.com/pixelpogo/).

## Installation

To install the gem use the following command:

    $ gem install uberssh

## Usage

1. Create the file `.uberssh` in your home directory.
2. Define your Uberspaces in `.uberssh`:

  ```yaml
  # ~/.uberssh
  accounts:
    foo:                              # your Uberspace account name
      project: "My Foo"               # an arbitrary description of the project
      hostname: cepheus.uberspace.de  # the hostname of your Uberspace
      ssh_key: ~/.ssh/uberspace_rsa   # the ssh key used to connect to your Uberspace
    bar:
      project: "My Bar"
      hostname: perseus.uberspace.de
      ssh_key: ~/.ssh/uberspace_rsa
    # ...
  ```

3. Run `uberssh` from your command line.

## Upgrading from 0.1.0 to 0.2.0

The configuration file format has changed slightly in version 0.2.0. The name of the key `ssh-key` was changed to `ssh_key`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec uberssh` to use the code located in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/baschtl/uberssh/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

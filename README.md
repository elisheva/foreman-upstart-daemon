# Foreman::Upstart::Daemon

##Introduction

     Foreman export the application in upstart-daemon format

## Installation

Add this line to your application's Gemfile:

    gem 'foreman-upstart-daemon'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install foreman-upstart-daemon

##Usage

   $ foreman export upstart-daemon [location]

     Foreman export your application to [location] path.

For example:

   foreman export upstart-daemon /etc/init
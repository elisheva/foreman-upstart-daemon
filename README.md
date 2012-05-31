# Foreman::Upstart::Daemon

##Introduction

Foreman export the application in upstart-daemon format.
By this, we use upstart's capabilities in order to monitor the processes.
Upstart - an event-based which handles starting of tasks and services during boot,stopping them during shutdown and supervising them while the system is runnin. Foreman export app files to upstart on deployment. Used for products services and Mapping API

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
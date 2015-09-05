# Listening Post ![](noun_32878sm.png)

[![Circle CI](https://circleci.com/gh/chaserx/listeningpost.svg?style=svg)](https://circleci.com/gh/chaserx/listeningpost)

## What

An Internet of Things Relay Station.

## Goals

#### Work in Progress

Main goal: create an application that estabilishes an IoT device endpoint for
said devices to POST data. Output from these devices can be watched by associated
devices. Message POSTs can trigger one or more webhooks.

##### some planned features

- simple user/password auth including token auth with JWT
- RESTful API for users, devices, messages, webhooks
- create device at /devices
- accept message for a device via POST to /devices/abc-123-xyz-pdq/messages
- GET data feed at /devices/abc-123-xyz-pdq/messages
- send optional filter to limit return of messages
- prep for update to Rails 5 on release
- build CLI app possibly in Go

## How

### Ruby version

`ruby 2.2.2`

### System dependencies

- postgresql

### Configuration

### Database initialization

#### Mac

- `brew install postgres`
- `initdb /usr/local/var/postgres -E utf8`

### Database creation

- `bundle exec rake db:create`
- `bundle exec rake db:migrate`

### How to run the test suite

- `bundle exec rspec spec`

### How to run the style linter

- `bundle exec rubocop`

### Services (job queues, cache servers, search engines, etc.)

Use foreman to manage processes. `gem install foreman`. `foreman start`

### Deployment instructions

Possibly on Heroku...

* ...

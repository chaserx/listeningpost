# Listening Post

## What

An Internet of Things relay station.

## Goals

Main goal: create an application that estabilishes an IoT device endpoint for
said devices to POST data. Output from these devices can be watched by associated devices. Message POSTs can trigger a callback, a webhook, or both.

- simple user/password auth including token auth
- RESTful API for users, devices, messages, callbacks, webhooks
- create device at /devices
- accept POST to /devices/abc-123-xyz-pdq
- GET data feed at /devices/abc-123-xyz-pdq
- prep for update to Rails 5 on release
- build CLI app possibly in Go

## How

### Ruby version

`ruby 2.2.2`

### System dependencies

- postgresql

### Configuration

### Database creation

- `bundle exec rake db:create`
- `bundle exec rake db:migrate`

### Database initialization

- `brew install postgres`
- `initdb /usr/local/var/postgres -E utf8`

### How to run the test suite

- `bundle exec rspec spec`

### Services (job queues, cache servers, search engines, etc.)

Use foreman. `gem install foreman`. `foreman start`

### Deployment instructions

Possibly on Heroku...

* ...

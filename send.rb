#!/usr/bin/env ruby
# encoding: utf-8
require 'bunny'

conn = Bunny.new(host: 'localhost', port: 5672, heartbeat: 1)
conn.start

ch   = conn.create_channel
q    = ch.queue('hello')

ch.default_exchange.publish('Hello World!', routing_key: q.name)
puts " [x] Sent 'Hello World!'"

conn.close

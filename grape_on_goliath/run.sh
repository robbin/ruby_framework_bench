#!/bin/sh

RACK_ENV=production bundle exec ruby server.rb -sv -e prod -p 9000

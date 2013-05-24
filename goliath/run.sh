#!/bin/sh

RACK_ENV=production WAIT_TIME=0.0 bundle exec ruby server.rb -sv -e prod -p 9000

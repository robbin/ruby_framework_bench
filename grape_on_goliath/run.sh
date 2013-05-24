#!/bin/sh

RACK_ENV=production WAIT_TIME=0.1 bundle exec ruby server.rb -sv -e prod -p 9000

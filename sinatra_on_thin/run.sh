#!/bin/sh

WAIT_TIME=0.5 bundle exec thin start -e production -p 9000

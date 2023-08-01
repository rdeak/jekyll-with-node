#!/bin/bash
set -e

if [ -f package.json ]; then
  npm install
fi

if [ -f Gemfile ]; then
  bundle install --retry 5 --jobs 20
fi

exec "$@"
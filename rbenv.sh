#!/bin/bash

set -e

LATEST_RUBY_VERSION=$(rbenv install -l | grep -v - | tail -1 | xargs)
rbenv install --skip-existing $LATEST_RUBY_VERSION
rbenv global $LATEST_RUBY_VERSION

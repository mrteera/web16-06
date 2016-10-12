#!/bin/bash

rubocop -RDS --fail-fast && \
haml-lint app/views/ && \
bundle exec rspec && \
rails cucumber

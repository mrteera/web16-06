#!/bin/bash

rubocop -RDS --fail-fast && \
haml-lint app/views/ && \
rails test -f && \
rails cucumber

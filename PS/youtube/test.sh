#!/bin/bash

rubocop -RDS --fail-fast && \
haml-lint app/views/ && \
rails test && \
rails cucumber

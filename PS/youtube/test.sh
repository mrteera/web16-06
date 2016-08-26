#!/bin/bash

rubocop -RDS --fail-fast && \
rails test && \
rails cucumber

#!/bin/sh

rails db:create db:migrate db:seed
rails s -p 3000 -b 0.0.0.0

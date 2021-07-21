#!/bin/bash

echo 'building prod version'

export JEKYLL_ENV=production 
bundle exec jekyll build

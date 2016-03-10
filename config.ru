require 'bundler/setup'
require 'sinatra'

require File.expand_path '../btconvert.rb', __FILE__

run Btconvert

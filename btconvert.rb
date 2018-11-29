#!/usr/bin/env ruby
require 'bundler/setup'
require 'blockchain'
require 'sinatra'

get '/' do
  'cryvert: no currency passed'
end

get '/btc' do
  if params[:btc].nil?
    'BTC value not passed!'
  else
    cur = params.fetch("cur", "USD")
    toConv = params[:btc].to_f
    btcStats = Blockchain::get_ticker()
    oneBtc = btcStats["#{cur}"].p15min
    convAmt = toConv * oneBtc
    body "#{convAmt}"
  end
end
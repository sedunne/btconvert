#!/usr/bin/env ruby

require 'bundler/setup'
require 'blockchain'
require 'sinatra/base'
require 'redis'

class Btconvert < Sinatra::Base

  redis = Redis.new(:host => "127.0.0.1", :port => "6379", :db => "11")
  
  get '/btconvert' do
    body "noidontwantthat"
  end
  
  post '/btconvert' do
    if params[:btc].nil?
      body "BTC value not passed!"
    else
      cur = params.fetch("cur", "USD")
      isCached = redis.get("#{cur}:btc")
      if isCached.nil?
        toConv = params[:btc].to_f
        btcStats = Blockchain::get_ticker()
        oneBtc = btcStats["#{cur}"].p15min
        redis.set("#{cur}:btc", oneBtc.to_f)
        convAmt = toConv * oneBtc
        body "#{convAmt}"
      else
        body "#{isCached}"
      end
    end
  end

end

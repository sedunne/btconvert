# app.rb
require 'rubygems'
require 'bundler/setup'
require 'Blockchain'
require 'sinatra'
require 'sinatra/json'

explorer = Blockchain::ExchangeRateExplorer.new

get '/tobtc/:cur/:btc' do
  toConvert = params[:btc].to_f
  convertAmount = explorer.to_btc(params[:cur], toConvert)
  json params[:cur] => convertAmount
end

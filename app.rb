require 'bundler/setup'
require 'sinatra'
require 'json'
require 'pry'

set :environment, :development
set :logging, true

get '*' do
  env = request.env.dup
  env.reject! do |key, value|
    key.match(/^(rack|sinatra|SERVER|GATEWAY|REMOTE)/) || value.empty?
  end

  result = JSON.pretty_generate env
  puts
  puts result
  puts

  result
end

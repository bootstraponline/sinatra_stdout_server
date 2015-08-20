require 'bundler/setup'
require 'sinatra'
require 'json'
require 'pry'

set :environment, :development
set :logging, true

def dump_env
  env = request.env.dup
  env.reject! do |key, value|
    empty_value = value.respond_to?(:empty?) && value.empty?

    # whitelist
    if key.match /^rack.request/
      empty_value
    else # blacklist
      key.match(/^(rack|sinatra|SERVER|GATEWAY|REMOTE)/) || empty_value
    end
  end

  # binding.pry

  result = JSON.pretty_generate env
  puts
  puts result
  puts

  result
end

get '*' do
  dump_env
end

post '*' do
  dump_env
end

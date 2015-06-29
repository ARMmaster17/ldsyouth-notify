#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'slim'
require 'rest-client'
require 'json'
require_relative 'inc/api'
require_relative 'inc/mail'
require_relative 'inc/pagevars'
require_relative 'inc/config'

enable :sessions

helpers do
  def login?
    return false
  end
end

get '/' do
  @PageTitle = 'Home'
  @TRAVISBUILDNUMBER = Pagevars.setVars("CIbuild")
  @configWard = Config.getVar("ward")
  slim :home
end

get '/api' do
  API.a()
end
get '/api/mail/validate' do
  API.mailvalidate(:params['m'])
end
get '/api/config' do
  # return config in JSON
  return 'ERROR: NotImplemented'
end
get '/api/config/ward' do
  return '{ "ward":"#{Config.getVar("ward")}" }'
end

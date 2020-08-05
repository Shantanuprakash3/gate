# encoding: UTF-8
require 'json'
require 'sinatra'
require 'sinatra/base'

require_relative 'helpers/authentication'
require_relative 'helpers/format_response'
require_relative 'routes/init'

class MyApp < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :environment, :development
  enable :sessions

  #helpers Sinatra::MyApp::Authentication
  helpers Sinatra::MyApp::ResponseFormat
  #helpers Sinatra::MyApp::AppError
  
  register Sinatra::MyApp::Routes::FruitRoutes
  #register Sinatra::MyApp::Routes::UserRoutes

end
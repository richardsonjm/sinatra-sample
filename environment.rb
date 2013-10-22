# specify what is needed in the environment
require 'bundler'  

Bundler.require

# require "sinatra/base"
# require "sinatra/reloader"

require_relative './app/controllers/application_controller.rb'
require_relative './app/controllers/main_controller.rb'


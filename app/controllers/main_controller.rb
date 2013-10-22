class MainController < ApplicationController  

  get '/' do
    erb :'index'
  end

  get '/test' do
    "TESTING 123"
  end
end
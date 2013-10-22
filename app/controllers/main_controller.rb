class MainController < ApplicationController  

  get '/' do
    @time_now = Time.now

    erb :'main/index'
  end

  get '/students/:name' do
    erb :'main/students'
  end
end

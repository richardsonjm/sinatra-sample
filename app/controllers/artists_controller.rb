class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all.sort_by{|a| a.name}
    erb :'artists/index'
  end

end
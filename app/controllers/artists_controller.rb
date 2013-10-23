class ArtistsController < ApplicationController

  get '/artists' do
    @artists = load_artists
    erb :'artists/index'
  end

  get '/artists/new' do
    erb :'artists/new'  
  end

  get '/artists/:id' do
    @artist = Artist.find_by_slug(params[:id])
    erb :'artists/show'
  end


  post '/artists' do
    # to create a new artist
    Artist.new(params[:artist])

    redirect "/artists/#{artist.slug}"
  end
  
  def load_artists
    Artist.all.sort_by{|a| a.name}
  end

end


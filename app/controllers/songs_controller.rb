class SongController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if !params[:artist][:name].empty?
      @song.artist = Artist.create(name: params[:artist][:name])
    end
    if !params[:genre][:name].empty?
      @song.genres << Genre.create(name: params[:genre][:name])
    end
    redirect '/songs'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    if !params[:artist][:name].empty?
      @song.artist = Artist.create(name: params[:artist][:name])
    end
    if !params[:genre][:name].empty?
      @song.genres << Genre.create(name: params[:genre][:name])
    end
    redirect '/songs/:slug'
  end

end

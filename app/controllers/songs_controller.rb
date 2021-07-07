require 'rack-flash'

class SongController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end


  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    Artist.find_by_name(params[:artist][:name]) ? @song.artist = Artist.find_by_name(params[:artist][:name]) : @song.artist = Artist.create(name: params[:artist][:name])
    if !params[:genre][:name].empty?
      @song.genres << Genre.create(name: params[:genre][:name])
    end
    params[:genres].each do |i|
      @song.genres << Genre.find(i)
    end
    if @song.save
      flash[:message] = "Successfully created song."
    end
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if !params[:song][:name].empty?
      @song.update(name: params[:song][:name])
    end
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end
    if !params[:genre][:name].empty?
      @song.genres << Genre.create(name: params[:genre][:name])
    end
    params[:genres].each do |i|
      @song.genres << Genre.find(i)
    end
    if @song.save
      flash[:message] = "Successfully updated song."
    end
    redirect "/songs/#{@song.slug}"
  end

end

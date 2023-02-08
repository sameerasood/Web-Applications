# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/album_repository'
    also_reload 'lib/artist_repository'
  end

  get '/albums/new' do
    return erb(:new_album)
  end

  post '/albums' do
    repo = AlbumRepository.new
    new_album = Album.new
    new_album.title = params[:title]
    new_album.release_year = params[:release_year]
    new_album.artist_id = params[:artist_id]
    repo.create(new_album)
  end

  get '/albums/:id' do
    album_repo = AlbumRepository.new
    artist_repo = ArtistRepository.new
    @album = album_repo.find(params[:id])
    @artist = artist_repo.find(@album.artist_id)
    return erb(:albums_id)
  end

  get '/albums' do
    album_repo = AlbumRepository.new
    @albums = album_repo.all
    return erb(:get_albums)
  end

  get '/artists' do
    artist_repo = ArtistRepository.new
    @artists = artist_repo.all
    return erb(:get_artists)
  end

  get '/artists/new' do
    return erb(:new_artist)
  end

  get '/artists/:id' do
    artist_repo = ArtistRepository.new
    @artist = artist_repo.find(params[:id])
    return erb(:artists_id)
  end

  post '/artists' do
    repo = ArtistRepository.new
    new_artist = Artist.new
    new_artist.name = params[:name]
    new_artist.genre = params[:genre]
    repo.create(new_artist)
  end
end
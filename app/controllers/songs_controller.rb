class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_parms(:name, :artist_id, :genre_id))
    @song.save
    redirect_to song_path(@song)
  end

  def edit
    show
  end

  def update
    show
    @song.update(song_parms(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end

  private
  def song_parms(*args)
    params.require(:song).permit(*args)
  end
end
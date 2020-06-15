class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params(:name, :bio))
    @artist.save
    redirect_to artist_path(@artist)
  end

  def edit
    show
  end

  def update
    show
    @artist.update(artist_params(:name, :bio))
    redirect_to artist_path(@artist)
  end

  private
  def artist_params(*args)
    params.require(:artist).permit(*args)
  end
end
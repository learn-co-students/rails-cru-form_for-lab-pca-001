class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
  end

  def new
  end

  def create
    @genre = Genre.create(strong_params(:name, :bio))
    redirect_to genre_path(@genre)
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.update(strong_params(:name, :bio))
    redirect_to genre_path(@genre)
  end

  private

  def strong_params(*args)
    params.require(:genre).permit(*args)
  end
end

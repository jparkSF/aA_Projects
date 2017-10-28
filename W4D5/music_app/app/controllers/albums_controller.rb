class AlbumsController < ApplicationController
  def new
    @album = Album.new
    @bands = Band.all
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to band_url(@album.band_id)
    else
      flash.now[:errors] = ["Something went wrong..."]
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])

  end

  def show
    @album = Album.find(params[:id])

  end

  def update
    @album = Album.find(params[:id])
  end

  def destroy
    @album = Album.find(params[:id])
  end

  def index
  end

  private
  def album_params
    params.require(:album).permit(:title, :year, :live, :band_id)
  end
end

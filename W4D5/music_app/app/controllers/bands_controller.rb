class BandsController < ApplicationController
  def index
    @bands = Band.all


  end

  def new
    @band = Band.new

  end

  def create
    @band = Band.new(band_params)
  end

  def edit
    @band = Band.find(params[:id])
  end

  def show
    @band = Band.find(params[:id])

  end

  def update
    @band = Band.find(params[:id])

  end

  def destroy
    @band = Band.find(params[:id])
    if @band.destroy
      flash[:errors] = ["You've just deleted #{@band.name}"]
      redirect_to bands_url
    else
      flash.now[:errors] = ['Oops! Something went wrong..']
      render :show
    end

  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end

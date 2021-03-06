class CatsController < ApplicationController

  before_action :verify_owner, only: [:edit, :update]
  

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color,
      :description, :name, :sex, :user_id)
  end

  def verify_owner
    cat_id = params[:id]
    unless current_user.cats.pluck(:id).include?(cat_id.to_i)
      flash[:error] = ["You must be the owner to make changes to the cat."]
      redirect_to cat_url(cat_id)
    end
  end
end

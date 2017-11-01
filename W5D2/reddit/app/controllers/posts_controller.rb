class PostsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to sub_url(params[:id])
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to sub_url(params[:id])
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, :user_id)
  end


end

class SessionsController < ApplicationController
  def index

  end
  def new
  end


  def create

    user = User.find_by_credentials(params[:user][:email],params[:user][:password])

    if user.nil?
      flash.now[:errors] = ["Invalid username of password"]
      render :new
    else

      login!(user)
      redirect_to bands_url
    end

  end


  def destroy
    logout!
    redirect_to new_session_url
  end
end

class Api::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(
                  params[:user][:username],
                  params[:user][:password]
    )

    if user
      login(user)
      render json: "success"
    else
      render json: ['Invalid login info.']
    end
  end

  def destroy
    if current_user
      logout!
      render json: {}
    else
      render status: :not_found
    end
  end
end

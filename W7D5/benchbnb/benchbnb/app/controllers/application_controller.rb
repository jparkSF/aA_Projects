class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def login(user)
    puts "="*8
    puts user.session_token
    puts "="*8

    puts session[:session_token].class
    puts "="*8
    @current_user = user
    session[:session_token] = user.reset_token!
    puts "="*8
    puts user.session_token
    puts "="*8
  end

  def logout
    current_user.reset_token!
    session[:session_token] = nil
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def require_login
    redirect_to new_api_session_url unless !!current_user
  end

end

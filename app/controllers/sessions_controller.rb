class SessionsController < ApplicationController

  def new
  end

  def create
    require 'pry'; binding.pry
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to user_path(user.uid)
  end
end

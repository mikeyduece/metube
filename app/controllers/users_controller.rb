class UsersController < ApplicationController

  def show
    @user = User.find_by(params[:uid])
  end
end

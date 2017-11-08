class FavoritesController < ApplicationController

  def index
    if current_user.favorites.nil?
      flash[:message] = "Go Favorite Something!"
      redirect_to videos_path
    else
      @favorites = current_user.favs
    end
  end
end

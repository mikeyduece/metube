class FavoritesController < ApplicationController

  def index
    @favorites = current_user.favs
    if @favorites.empty?
      render file: '/public/410'
    else
      render :index
    end
  end

  def destroy
    favorite = Favorite.find_by_video_id(params[:id])
    favorite.delete
    flash[:message] = "#{params[:title]} has been unfavorited!"
    redirect_to favorites_path
  end
end

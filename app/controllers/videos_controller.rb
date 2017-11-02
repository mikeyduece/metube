class VideosController < ApplicationController

  def index
    @videos = Video.search_videos(params[:q])
  end
end

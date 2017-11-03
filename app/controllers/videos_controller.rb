class VideosController < ApplicationController

  def index
    @videos = Video.search_videos(params[:q])
  end

  def create
    video = VideoService.add_favorite(vid_params)
    require 'pry'; binding.pry
    current_user.favorites << video
  end

  private

    def attrs
      {
        etag:         params['etag'],
        video_id:     params['video_id'],
        img_high:     params['img_high'],
        img_default:  params['img_default'],
        title:        params['title'],
        published_at: params['published_at'],
        description:  params['description']
      }
    end

    def vid_params
      params.fetch(:video, {}).permit(:etag, :video_id, :img_high, :img_default, :title, :published_at, :description)
    end
end

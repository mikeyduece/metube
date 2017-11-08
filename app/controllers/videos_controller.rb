class VideosController < ApplicationController

  def index
    @videos = Video.search_videos(params[:q])
  end

  def new
    @video = Video.new
  end

  def create
    video = VideoService.add_video(attrs)
    favorite = Favorite.make_fav(current_user.id, video.id)
    current_user.favorites << favorite
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

end

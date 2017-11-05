class PlaylistsController < ApplicationController

  def new
    @playlist = Playlist.new
  end

  def create
    params[:name] = params['playlist']['name'] if params['playlist'].present?
    video = VideoService.add_video(params)
    playlist_video = Playlist.add_to_playlist(video, params[:user_id], params[:name])
    current_user.playlists << playlist_video
    redirect_to user_path(current_user)
  end

end

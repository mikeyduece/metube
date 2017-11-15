class PlaylistsController < ApplicationController

  def show
    @playlist = current_user.playlist_videos(params[:id])
  end

  def new
    @playlist = Playlist.new
  end

  def create
    params[:name] = params['playlist']['name'] if params['playlist'].present?
    video = VideoService.add_video(params)
    playlist_video = Playlist.add_to_playlist(video, params[:user_id], params[:name])
    current_user.playlists << playlist_video
    redirect_to playlist_path(params[:name])
  end

  def destroy
    playlist = current_user.user_list(params[:id], current_user.id)
    flash[:notice] = "You have deleted #{current_user.video_name(params[:id])}."
    playlist.delete
    redirect_to playlist_path(playlist.name)
  end

end

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
    redirect_to user_path(current_user)
  end

  def destroy
    playlists = Playlist.user_list(params[:id], current_user.id)
    flash[:notice] = "You have deleted #{playlists[0].name}."
    playlists.delete_all
    redirect_to user_path(current_user)
  end

end

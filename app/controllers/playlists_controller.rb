class PlaylistsController < ApplicationController

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.make_playlist(params)
  end
end

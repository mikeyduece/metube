class Playlist < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :video, optional: true

  def self.make_playlist(params)
    playlist = Playlist.where(video_id: params[:video_id]).first
    if playlist
      nil
    elsif playlist.nil?
      playlist = Playlist.create(name: params[:name],
                                 user_id: params[:user_id],
                                 video_id: params[:video_id]
                                )
    end
    playlist
  end
end

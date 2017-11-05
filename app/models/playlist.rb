class Playlist < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :video, optional: true

  def self.add_to_playlist(video, user, name)
    require 'pry'; binding.pry
    playlist = Playlist.where(yt: video.video_id).first
    if playlist
      nil
    elsif playlist.nil?
      playlist = Playlist.create(name: name,
                                 user_id: user.to_i,
                                 video_id: video.id,
                                 yt: video.video_id
                                )
    end
    playlist
  end
end

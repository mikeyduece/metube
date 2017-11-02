class Video < ApplicationRecord
  has_many :playlists
  has_many :users, through: :playlists

  def self.search_videos(vid)
    VideoService.search_videos(vid)
  end
end

class Video < ApplicationRecord
  has_many :playlists
  has_many :users, through: :playlists

  validates :videoId, uniqueness: true, presence: true

  def self.search_videos(vid)
    VideoService.search_videos(vid)
  end
end

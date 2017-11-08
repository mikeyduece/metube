class Video < ApplicationRecord
  has_many :playlists#, dependent: :destroy
  has_many :users, through: :playlists
  has_many :favorites#, dependent: :destroy
  has_many :users, through: :favorites

  validates :video_id, uniqueness: true, presence: true


  def self.search_videos(vid)
    VideoService.search_videos(vid).compact!
  end

end

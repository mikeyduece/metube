class Video < ApplicationRecord
  has_many :playlists, dependent: :destroy
  has_many :users, through: :playlists
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  validates :video_id, uniqueness: true, presence: true

  before_destroy :delete_playlist
  before_destroy :delete_favorite

  def self.search_videos(vid)
    VideoService.search_videos(vid)
  end

  private

    def delete_playlist
      Playlist.where(video_id: :id).delete
    end

    def delete_favorite
      Favorite.where(video_id: :id).delete
    end
end

class User < ApplicationRecord
  has_many :playlists
  has_many :videos, through: :playlists
  has_many :favorites
  # has_many :videos, through: :favorites

  validates :name, uniqueness: true
  validates :first_name, uniqueness: true
  validates :last_name, uniqueness: true
  validates :email, uniqueness: true
  validates :uid, uniqueness: true

  def self.from_omniauth(auth)
    user = User.where(uid: auth["uid"]).first
    if user && user.token != auth["credentials"]["token"]
      user.token = auth["credentials"]["token"]
      user.save
    elsif user.nil?
      user = User.create(uid: auth["uid"],
                         name: auth["info"]["name"],
                         email: auth["info"]["email"],
                         image: auth["info"]["image"],
                         first_name: auth["info"]["first_name"],
                         last_name: auth["info"]["last_name"],
                         token: auth["credentials"]["token"])
    end
    user
  end

  def playlist_names
    playlists.pluck('DISTINCT name')
  end

  def playlist_videos(name)
    video_ids = playlists.where(name: name).pluck(:video_id)
    Video.where(id: video_ids)
  end
end

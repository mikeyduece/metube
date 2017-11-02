class User < ApplicationRecord
  has_many :playlists
  has_many :videos, through: :playlists

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
end

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :video

  def self.make_fav(user_id, video_id)
    favorite = Favorite.where(video_id: video_id).first
    if favorite
      nil
    elsif favorite.nil?
      favorite = Favorite.create(user_id: user_id, video_id: video_id)
    end
    favorite
  end
end

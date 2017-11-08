module FavoritesHelper

  def favorite_video_ids
    @favorites.pluck(:video_id)
  end

  def first_fav_vid
    favorite_video_ids.first
  end

  def rest_of_favs
    favorite_video_ids[1..-1].join(',')
  end

end

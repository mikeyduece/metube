module PlaylistHelper

  def playlist_video_ids
    @playlist.pluck(:video_id)
  end

  def first_playlist_video
    playlist_video_ids.first
  end

  def rest_of_vids
    playlist_video_ids[1..-1].join(',') unless playlist_video_ids.empty?
  end
end

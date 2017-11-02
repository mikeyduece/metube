class VideoService
  attr_reader :etag, :video_id, :img_high,
              :img_default, :title,
              :published_at, :description

  def initialize(attrs)
    @etag         = attrs[:etag]
    @video_id     = attrs[:id][:videoId]
    @img_high     = attrs[:snippet][:thumbnails][:high][:url]
    @img_default  = attrs[:snippet][:thumbnails][:default][:url]
    @title        = attrs[:snippet][:title]
    @published_at = attrs[:snippet][:published_at]
    @description  = attrs[:snippet][:description]
  end

  def self.search_videos(vid)
    vids = YoutubeService.search_videos(vid)
    vids[:items].map do |attrs|
      VideoService.new(attrs)
    end
  end

end

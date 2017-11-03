class VideoService
  attr_reader :etag, :video_id, :img_high,
              :img_default, :title,
              :published_at, :description

  def initialize(attrs)
    require 'pry'; binding.pry
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

  def self.add_favorite(attrs)
    video = Video.where(video_id: attrs[:video_id]).first
    if video && video.etag != attrs[:etag]
      video.etag = attrs[:etag]
      video.save
    elsif video.nil?
      video = Video.create(etag:       attrs[:etag],
                          video_id:      attrs[:video_id],
                          img_high:     attrs[:img_high],
                          img_default:  attrs[:image_default],
                          title:        attrs[:title],
                          published_at: attrs[:published_at],
                          description:  attrs[:description]
                          )
    end
    video
  end

end

class YoutubeService

  def initialize(vid)
    @vid = vid
    @conn = Faraday.new(url: "https://www.googleapis.com/youtube/v3/") do |faraday|
      faraday.params["part"] = 'snippet'
      faraday.params["maxResults"] = '50'
      faraday.params["key"] = "#{ENV['YT_API']}"
    end
  end

  def get_url(url)
    require 'pry'; binding.pry
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_videos(vid)
    new(vid).search_videos
  end

  def search_videos
    get_url("search?q=#{vid}")
  end

  private
    attr_reader :vid
end

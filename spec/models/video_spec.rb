require 'rails_helper'

RSpec.describe Video, type: :model do
  it {should validate_uniqueness_of :video_id}
  it {should validate_presence_of   :video_id}

  it 'is able to search videos from YouTube' do
    VCR.use_cassette('video_model_search') do
      vid = 'firefly'
      videos = Video.search_videos(vid)

      expect(videos.count).to eq(50)
      expect(videos[0]).to be_a(VideoService)
    end
  end
end

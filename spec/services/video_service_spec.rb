require 'rails_helper'

describe 'VideoService' do
  it 'searches videos form youtube' do
    VCR.use_cassette('service_vids') do
      vids = VideoService.search_videos('Firefly')

      expect(vids.count).to eq(50)
      expect(vids[0]).to be_a(VideoService)
    end
  end

    it 'adds videos' do
      VCR.use_cassette('service_vids') do
        attrs = {etag:        "string",
                 video_id:     "string_thing",
                 img_high:     "another_string",
                 img_default:  "default_string",
                 title:        "Title",
                 published_at: "Date",
                 description:  "It's a thing'"
        }
        vid = VideoService.add_video(attrs)

        expect(vid).to be_a(Video)
        expect(vid.etag).to eq(attrs[:etag])
      end
    end
end

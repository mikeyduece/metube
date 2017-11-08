require 'rails_helper'

describe 'Youtube Service' do
  it 'does the youtube thing' do
    VCR.use_cassette('service_stuff') do
      service = YoutubeService.new('Firefly')

      expect(service).to be_a(YoutubeService)
    end
  end
end

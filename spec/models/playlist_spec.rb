require 'rails_helper'

RSpec.describe Playlist, type: :model do
  context 'Class Methods' do
    it '.add_to_playlist' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      video = create(:video)
      name = 'Firefly'

      playlist = Playlist.add_to_playlist(video, user.id, name)

      expect(playlist).to be_a(Playlist)
      expect(playlist.name).to eq('Firefly')
      expect(playlist.yt).to eq(video.video_id)
      expect(playlist.id).to eq(video.id)
      expect(playlist.user_id).to eq(user.id)
    end

  end
end

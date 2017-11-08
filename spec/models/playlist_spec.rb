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

    it '.user_list' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      video = create(:video)
      playlist = create(:playlist, video_id: video.id, yt: video.video_id, user_id: user.id, name: 'Firefly')

      playlists = Playlist.user_list(playlist.name, user.id)

      expect(playlists[0]).to be_a(Playlist)
      expect(playlists[0].name).to eq('Firefly')
      expect(playlists[0].yt).to eq(video.video_id)
      expect(playlists[0].id).to eq(video.id)
      expect(playlists[0].user_id).to eq(user.id)
    end
  end
end

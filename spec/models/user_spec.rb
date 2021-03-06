require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_uniqueness_of :name}
  it {should validate_uniqueness_of :first_name}
  it {should validate_uniqueness_of :last_name}
  it {should validate_uniqueness_of :email}
  it {should validate_uniqueness_of :uid}
  context 'Instance Methods' do
    it '#playlist_names' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      user.playlists = create_list(:playlist, 5)
      user.playlists << create(:playlist, name: 'Firefly')

      names = user.playlist_names

      expect(names.count).to eq(2)
      expect(names[1]).to eq(user.playlists[0].name)
      expect(names[0]).to_not eq(user.playlists[0].name)
    end

    it '#playlist_videos' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      user.playlists = create_list(:playlist, 5)
      video = create(:video)
      user.playlists << create(:playlist, name: 'Firefly', video_id: video.id)

      videos = user.playlist_videos('Firefly')

      expect(videos[0]).to be_a(Video)
    end

    it '#favs' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      user.playlists = create_list(:playlist, 5)
      videos = create_list(:video, 5)

      favorites = videos[1..3]

      expect(favorites[0]).to be_a(Video)
      expect(favorites.count).to eq(3)
      expect(favorites[0].title).to eq(videos[0].title)
      expect(favorites).to_not include(videos[0])
    end

    it '#user_list' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      video = create(:video)
      playlist = create(:playlist, video_id: video.id, yt: video.video_id, user_id: user.id, name: 'Firefly')

      playlists = user.user_list(playlist.yt, user.id)

      expect(playlists).to be_a(Playlist)
      expect(playlists.name).to eq('Firefly')
      expect(playlists.yt).to eq(video.video_id)
      expect(playlists.user_id).to eq(user.id)
    end

    it '#video_name' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      video = create(:video)
      playlist = create(:playlist, video_id: video.id, yt: video.video_id, user_id: user.id, name: 'Firefly')

      name = user.video_name(playlist.yt)

      expect(name).to eq(video.title)
    end
  end
end

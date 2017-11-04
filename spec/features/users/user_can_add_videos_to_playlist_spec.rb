require 'rails_helper'

describe 'User' do
  it 'can create a playlist' do
    VCR.use_cassette('playlist_create') do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user.id)

      fill_in('q', with: 'firefly')
      click_on('submit')
      click_on('Create Playlist', match: :first)

      expect(current_path).to eq(new_playlist_path)

      fill_in('Playlist Name', with: 'Best Show Ever')
      click_on('Create')

      expect(current_path).to eq(user_path(user.id))
      expect(user.playlists.count).to eq(1)
      expect(user.playlists[0].name).to eq('Best Show Ever')
      expect(user.playlists[0]).to be_a(Playlist)
    end
  end
end

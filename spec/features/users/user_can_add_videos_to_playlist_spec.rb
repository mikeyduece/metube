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

      save_and_open_page
      expect(current_path).to eq(new_playlist_path)

      fill_in('Playlist Name', with: 'Best Show Ever')
      click_on('Create')

      expect(current_path).to eq(user_path(user.id))
      expect(user.playlists.count).to eq(1)
      expect(user.playlists[0].name).to eq('Best Show Ever')
    end
  end

  xit 'can create a playlist with info parent video' do
    VCR.use_cassette('playlist_create') do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user.id)

      fill_in('q', with: 'firefly')
      click_on('submit')
      click_on('Create Playlist', match: :first)

      playlist = user.playlists

      expect(playlist[0]).to be_a(Playlist)
      expect(playlist[0].name)
    end
  end
end

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
    end
  end
end

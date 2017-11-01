require 'rails_helper'

feature 'User' do
  scenario 'logged in user can see their stuff' do
    user = create(:user)

    visit user_path(user.id)

    expect(page).to have_content("#{user.first_name}'s Playlists")
    expect(page).to have_content(user.image)
  end
end

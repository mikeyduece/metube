require 'rails_helper'

feature 'User' do
  scenario 'logged in user can see their stuff' do
    user = create(:user)

    visit user_path(user.id)

    within('.play_list') do
      expect(page).to have_content('.list_name')
    end

    within('.favs') do
      expect(page).to have_content('.video_img')
    end

    expect(page).to have_content(user.image)
  end
end

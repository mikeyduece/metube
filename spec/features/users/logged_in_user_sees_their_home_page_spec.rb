require 'rails_helper'

feature 'User' do
  scenario 'logged in user can see their stuff' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user.id)

    expect(page).to have_content("Playlists")
    expect(page).to have_xpath("//img[contains(@src,'#{user.image}')]")
  end

  scenario 'logged in user cannot see another users info' do
    user = create(:user)
    user_2 = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user.id)

    expect(page).to_not have_content(user_2.first_name)
    expect(page).to_not have_content(user_2.image)
  end

  scenario 'can search for videos' do
    VCR.use_cassette('search') do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user.id)
      fill_in('q', with: 'firefly')
      click_on 'submit'

      expect(page).to have_css('.img-sample', count: 46)
    end
  end
end

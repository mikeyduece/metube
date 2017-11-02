require 'rails_helper'

feature 'User' do
  scenario 'registered user can search for videos' do
    VCR.use_cassette('user_search') do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user.id)

      fill_in(:q, with: 'bjj')
      click_on('submit')

      within('.vid_sample', match: :first) do
        expect(page).to have_css('.vid_title')
        expect(page).to have_css('.vid_image')
        expect(page).to have_css('.vid_desc')
      end
    end
  end
end

require 'rails_helper'

feature 'User' do
  scenario 'registered user can search for videos' do
    VCR.use_cassette('user_search') do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user.id)

      fill_in(:q, with: 'bjj')
      click_on('submit')

      within('.card', match: :first) do
        expect(page).to have_css('.card-title')
        expect(page).to have_css('.img-fluid')
        expect(page).to have_css('.card-text')
      end
    end
  end
end

require 'rails_helper'

feature 'User' do
  scenario 'can add video to favorites list' do
    VCR.use_cassette('favorites_list') do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user.id)
      fill_in('q', with: 'firefly')
      click_on 'submit'

      expect(page).to have_css('.card')
      expect(page).to have_css('.card-title')
      expect(page).to have_css('.card-text')
      expect(page).to have_css('.img-sample')

      user_vid = user.favorites
      find('button.glyphicon-heart-empty', match: :first).click

      expect(user_vid.count).to eq(1)
      expect(user_vid[0]).to be_a(Favorite)
    end
  end
end

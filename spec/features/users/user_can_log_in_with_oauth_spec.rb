require 'rails_helper'

feature 'User' do
  scenario 'can log in with oauth' do
    stub_omniauth

    visit root_path
    within '.loginBtn' do
      VCR.use_cassette('spec/features/users/user_can_log_in_with_oauth_spec.rb') do
        click_on 'Sign in with Google'
      end
    end
    expect(current_path).to eq(user_path(User.last.uid))

  end
end

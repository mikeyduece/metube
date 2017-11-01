require 'rails_helper'

feature 'User' do
  xscenario 'can log in with oauth' do
    stub_omniauth

    visit root_path
    click_button 'Sign in with Google'

    expect(current_path).to be(user_path(User.last.uid))

  end
end

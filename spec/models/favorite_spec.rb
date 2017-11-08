require 'rails_helper'

RSpec.describe Favorite, type: :model do

  context 'Class Methods' do
    it '.make_favs' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      video = create(:video)

      favorite = Favorite.make_fav(user.id, video.id)

      expect(favorite).to be_a(Favorite)
    end
  end
end


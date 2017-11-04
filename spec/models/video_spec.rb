require 'rails_helper'

RSpec.describe Video, type: :model do
  it {should validate_uniqueness_of :video_id}
  it {should validate_presence_of   :video_id}
end

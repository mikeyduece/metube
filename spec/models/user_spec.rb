require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_uniqueness_of :name}
  it {should validate_uniqueness_of :first_name}
  it {should validate_uniqueness_of :last_name}
  it {should validate_uniqueness_of :email}
  it {should validate_uniqueness_of :uid}
end

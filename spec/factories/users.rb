FactoryBot.define do
  factory :user do
    sequence(:uid) {|n| "#{n}Uid"}
    sequence(:name) {|n| "#{n}name"}
    sequence(:email) {|n| "#{n}email"}
    sequence(:first_name) {|n| "#{n}first_name"}
    sequence(:last_name) {|n| "#{n}last_name"}
    image "https://vignette.wikia.nocookie.net/animal-jam-clans-1/images/6/62/Happy-birthday-rick-astley.jpg/revision/latest?cb=20160825005957"
    token "MyString"
    token_expiration "MyString"
  end
end

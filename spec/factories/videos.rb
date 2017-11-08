FactoryBot.define do
  factory :video do
    etag "MyString"
    sequence :video_id {|n|"#{n}MyString"}
    img_default "MyString"
    img_high "MyString"
    title "MyString"
    published_at "MyString"
  end

end

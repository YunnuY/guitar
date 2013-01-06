# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    episode_id 1
    content "MyText"
    name "MyString"
    email "MyString"
    user_id 1
    ancestry "MyString"
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :episode do
    name "MyString"
    notes "MyText"
    published_at "2012-12-20 20:26:43"
    seconds 1
    description "MyText"
    comments_count 1
    youku "MyString"
  end
end

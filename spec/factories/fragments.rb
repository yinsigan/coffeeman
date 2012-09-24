# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fragment do
    home_mainbar_bottom "MyText"
    home_sidebar_bottom "MyText"
    topics_sidebar_bottom "MyText"
    footer "MyText"
    site_id 1
  end
end

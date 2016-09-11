FactoryGirl.define do
  factory :continent do
    sequence(:name) { |n| "continent#{n}"}
  end

  factory :bird do
    sequence(:name) { |n| "birdName#{n}"}
    family "family"
    added Time.new
    visible true
    continents { [FactoryGirl.build(:continent), FactoryGirl.build(:continent)] }
  end


end
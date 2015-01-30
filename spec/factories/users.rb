FactoryGirl.define do
  factory :user do
    name 'amol udage'
    sequence(:email) {|n| "amol#{n}@gmail.com"}
    password '1234567890'
    age 22
#gender 'M'
    association :role
#role
=begin after(:build) do |user|
        user.role = Role.find_by_name('admin') || FactoryGirl.create(:role)
       end
=end
    trait :gender do
      gender "M"
    end
  end
end

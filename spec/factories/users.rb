FactoryGirl.define do
  factory :user do
    first_name 'Oleg'
    last_name 'Voloshyn'
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'P@ssw0rd'
    password_confirmation 'P@ssw0rd'
  end
end

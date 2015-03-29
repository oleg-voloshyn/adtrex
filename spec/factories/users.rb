FactoryGirl.define do
  factory :user do
    login 'Oleg Voloshyn'
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'P@ssw0rd'
    password_confirmation 'P@ssw0rd'
  end
end

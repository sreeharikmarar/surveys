# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do 
    # u.username {|u| "#{Faker::Name.name}".gsub(" ","").downcase.strip }
    # u.email {|u| "#{u.username}@example.com" }
    # u.password "password"

  sequence(:username) {|n| "User Name #{n}".gsub(" ","").downcase.strip }
  sequence(:email) {|n| "user#{n}@test.com" }
  sequence(:password) {|n| "password" }
  end
end

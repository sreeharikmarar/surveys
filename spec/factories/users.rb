# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do 
      sequence(:username) {|n| "User Name #{n}".gsub(" ","").downcase.strip }
  	  sequence(:email) {|n| "user_#{n}@example.com" }
      sequence(:password) {|n| "password" }
  end
end

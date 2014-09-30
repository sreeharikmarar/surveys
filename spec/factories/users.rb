# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do 
  	  name = ([*('A'..'Z'),*('a'..'z')]).sample(5).join
      sequence(:username) {|n| "#{name}"}
  	  sequence(:email) {|n| "#{username}@example.com" }
      sequence(:password) {|n| "password" }
  end
end

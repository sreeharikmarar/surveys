# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :survey, :class => 'Survey' do

  	sequence(:title) {|n| " Sample survey #{n}" }
  	description "lorem ibsum lorem ibsum lorem ibsum"
  	end
end

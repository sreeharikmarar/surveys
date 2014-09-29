# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :survey, :class => 'Survey' do

  	sequence(:title) {|n| " Sample survey #{n}" }
  	description "loren ibsum loren ibsum loren ibsum"

  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do

    survey

  	text "choice 1"

  	type 'MultipleChoiceSingleQuestion'

    factory :essay_question do 
    	type 'EssayQuestion'
    end

    factory :numeric_question do 
    	type 'NumericQuestion'
    end

    factory :date_question do 
    	type 'DateQuestion'
    end

    factory :multiple_choice_single_question do 
    	type 'MultipleChoiceSingleQuestion'
    	option
    end

    factory :multiple_choice_multiple_question do 
    	type 'MultipleChoiceMultipleQuestion'
    	option
    end

  end
end

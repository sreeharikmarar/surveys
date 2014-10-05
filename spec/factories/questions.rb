# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do

    survey

  	text "Sample Question"

  	type 'EssayQuestion'

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
        # association :options, factory: :multiple_choice_single_option
    end

    factory :multiple_choice_multiple_question do
    	type 'MultipleChoiceMultipleQuestion'
        # association :options, factory: :multiple_choice_multiple_option
    end

  end
end

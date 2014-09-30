# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
  	feedback
  	association :question, factory: :multiple_choice_single_question
  	answer "choice_1"

  	factory :date_answer do
  		association :question, factory: :date_question
  		answer Date.today.to_s
  	end

  	factory :numeric_answer do
  		association :question, factory: :numeric_question
  		answer [*1..10].sample
  	end

  	factory :essay_answer do
  		association :question, factory: :essay_question
  		answer "Lorem Ipsum is simply dummy text of the printing and typesetting industry.
  		 Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
  		when an unknown printer took a galley of type and scrambled it to make a type 
  		specimen book. It has survived not only five centuries, but also the leap into 
  		electronic typesetting, remaining essentially unchanged. It was popularised in t
  		he 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
  		and more recently with desktop publishing software like Aldus PageMaker including 
  		versions of Lorem Ipsum."
  	end

  	factory :multiple_choice_single_answer do
  		association :question, factory: :multiple_choice_single_question
  		["choice_1","choice_2","choice_3","choice_4"].sample
    end

    factory :multiple_choice_multiple_answer do
    	association :question, factory: :multiple_choice_multiple_question
  		["choice_1","choice_2","choice_3","choice_4"].sample([*1..3].sample)
    end

  end
end

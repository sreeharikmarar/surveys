class Survey < ActiveRecord::Base

	# attr_accessor :title , :description , :is_published , :create_at , :updated_at
	has_many :questions , :class_name => "Question"
	accepts_nested_attributes_for :questions

	def self.update_params params
		s = self.create(:title => params["title"] , :description => params["description"])
		questions = params["questions_attributes"]
		questions.each do |key,value|
			case value["type"]
		    when "EssayQuestion"
		    	EssayQuestion.create(:text => value["text"], :survey_id => s.id )
		    when "DateQuestion"
		    	DateQuestion.create(:text => value["text"], :survey_id => s.id )
		    when "NumericQuestion"
		    	NumericQuestion.create(:text => value["text"], :survey_id => s.id )
		    when "MultipleChoiceSingle"
		    	m = MultipleChoiceSingleQuestion.create(:text => value["text"], :survey_id => s.id )
		    	options = value["option"].merge({"question_id" => m.id})
		    	Option.create(options)
		    when "MultipleChoiceMultiple"
		    	m = MultipleChoiceMultipleQuestion.create(:text => value["text"], :survey_id => s.id )
		    	options = value["option"].merge({"question_id" => m.id})
		    	Option.create(options)
		    end
		end
		self
	end	
end

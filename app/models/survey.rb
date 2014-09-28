class Survey < ActiveRecord::Base

	# attr_accessor :title , :description , :is_published , :create_at , :updated_at
	has_many :questions , :class_name => "Question"

	accepts_nested_attributes_for :questions ,  allow_destroy: true
	

	validates :title , :presence => true , :length => {:minimum => 1 ,:maximum => 100 }
	validates :description, :presence => true , :length => {:minimum => 1 , :maximum => 250 }


	def self.update_params params
		questions = params["questions_attributes"] || {}
		s = self.create(:title => params["title"] , :description => params["description"])
		s.questions_attributes = questions
		
		if questions.any?
			questions.each do |key,value|
				case value["type"]
		    	when "EssayQuestion"
		    		EssayQuestion.new(:text => value["text"], :survey_id => s.id )
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
		end
		s
	end
end

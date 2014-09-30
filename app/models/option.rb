class Option < ActiveRecord::Base

	serialize :option 
	
	belongs_to :question, :class_name => "Question" ,:foreign_key  => "question_id"
	belongs_to :survey , :class_name => "Survey" , :foreign_key => "survey_id"

	def option_list
		[option_1,option_2,option_3,option_4]
	end
end

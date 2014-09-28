class Option < ActiveRecord::Base

	belongs_to :question, :class_name => "Question" ,:foreign_key  => "question_id"
	belongs_to :survey , :class_name => "Survey" , :foreign_key => "survey_id"

end

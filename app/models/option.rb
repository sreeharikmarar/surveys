class Option < ActiveRecord::Base

	serialize :value
	
	belongs_to :question, :class_name => "Question" ,:foreign_key  => "question_id"

	validates :value , :presence => true	
	
end

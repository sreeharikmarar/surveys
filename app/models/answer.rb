class Answer < ActiveRecord::Base
	
	serialize :answer

	belongs_to :question , :class_name => "Question"
	
	belongs_to :feedback , :class_name => "Feedback"

	validates :answer , :presence => true

end

class Answer < ActiveRecord::Base
	
	serialize :answer

	belongs_to :question , :class_name => "Question"
	
	belongs_to :feedback , :class_name => "Feedback"

	validates :feedback , :presence => true

	validates :question , :presence => true

	validates :answer , :presence => true 

	validates_numericality_of :answer, :if => :numeric_question?

	validate :answer_type

	def numeric_question?
		question.type == "NumericQuestion"
	end
	

	def answer_type
		
		case question.type
		when "DateQuestion"	
			answer.to_date rescue errors.add(:answer, "Your answer should be a Date value")
		when "EssayQuestion"
		    errors.add(:answer, "Your answer should contain atleast 50 characters") if answer.blank? || answer.length < 50 
		when "MultipleChoiceSingleQuestion"
			puts " from model #{question.option_list}"
			puts " from model #{answer}"
			errors.add(:answer, "Your answer should be selected from the Options given") unless question.option_list.include?(answer.to_s)
		end
	end
end



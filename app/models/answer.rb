class Answer < ActiveRecord::Base
	
	serialize :answer

	belongs_to :question , :class_name => "Question"
	
	belongs_to :feedback , :class_name => "Feedback"

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
		    errors.add(:answer, "Your answer should contain atleast 20 characters") if answer.blank? || answer.length < 20 
		when "MultipleChoiceSingleQuestion"
			errors.add(:answer, "Your answer should be selected from the Options given") unless question.option_list.include?(answer)
		when "MultipleChoiceMultipleQuestion"
			a = answer.first answer.size - 1
			errors.add(:answer, "Your answer should be selected from the Options given") unless question.option_list.include?(a.sample)
		end
	end
end



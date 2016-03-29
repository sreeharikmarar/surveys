class Answer < ActiveRecord::Base

	serialize :value

	belongs_to :question , :class_name => "Question"

	belongs_to :feedback , :class_name => "Feedback"

	validates :question , :presence => true

	validates_numericality_of :value, :if => :numeric_question?

	validates :value , :presence => true

	validate :answer_type

	def numeric_question?
		question.type == "NumericQuestion"
	end

	def answer_type
		case question.type
		when "DateQuestion"
			value.to_date rescue errors.add(:value, "Your answer should be a Date value")
		when "EssayQuestion"
			errors.add(:value, "Your answer should contain atleast 20 characters") if value.blank? || value.length < 20
		when "MultipleChoiceSingleQuestion"
			errors.add(:value, "Your answer should be selected from the Options given") unless question.option_list.include?(value)
		when "MultipleChoiceMultipleQuestion"
			v = value.first value.size - 1
			errors.add(:value, "Your answer should be selected from the Options given") unless question.option_list.include?(v.sample)
		end
	end
end



class Question < ActiveRecord::Base

	belongs_to :survey , :class_name => "Survey"

	has_many :answers , :class_name => "Answer" , :dependent => :destroy

	has_one :option 
	
	accepts_nested_attributes_for :option , allow_destroy: true , :reject_if => :check_multiple_question

	validates :text , :presence => true , :length => {:minimum => 1 , :maximum => 250 }
	validates :type, :presence => true, :length => {:minimum => 1 , :maximum => 50 } 


	def self.types
		["EssayQuestion","DateQuestion","NumericQuestion","MultipleChoiceSingleQuestion","MultipleChoiceMultipleQuestion"]
	end

	def check_multiple_question
		%w[NumericQuestion DateQuestion EssayQuestion].include?(self.type)
	end

	def numeric_question?
		type == "NumericQuestion"
	end
	
	def date_question?
		type == "DateQuestion"
	end

	def essay_question?
		type == "EssayQuestion"
	end

	def multiple_choice_single?
		type == "MultipleChoiceSingleQuestion"
	end

	def multiple_choice_multiple?
		type == "MultipleChoiceMultipleQuestion"
	end

end


class Question < ActiveRecord::Base

	belongs_to :survey , :class_name => "Survey"

	has_many :answers , :class_name => "Answer" , :dependent => :destroy
	accepts_nested_attributes_for :answers , allow_destroy: true 

	has_many :options , :class_name => "Option" , :dependent => :destroy 

	accepts_nested_attributes_for :options , allow_destroy: true , :reject_if => :check_normal_question
		
	validates :text , :presence => true , :length => {:minimum => 1 , :maximum => 250 }
	validates :type, :presence => true, :length => {:minimum => 1 , :maximum => 50 } 

	validates :options , :presence => true , :if => :check_multiple_question

	def check_normal_question
		%w[EssayQuestion DateQuestion NumericQuestion].include?(type)
	end

	def check_multiple_question
	  %w[MultipleChoiceSingleQuestion MultipleChoiceMultipleQuestion].include?(type)
	end

	def self.types
		["EssayQuestion","DateQuestion","NumericQuestion","MultipleChoiceSingleQuestion","MultipleChoiceMultipleQuestion"]
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

	def option_list
		options.map { | option| option.value }
	end

end


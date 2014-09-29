class Question < ActiveRecord::Base

	belongs_to :survey , :class_name => "Survey"

	has_many :answers , :class_name => "Answer" , :dependent => :destroy

	has_one :option , :dependent => :destroy
	
	accepts_nested_attributes_for :option , allow_destroy: true

	validates :text , :presence => true , :length => {:minimum => 1 , :maximum => 250 }
	validates :type, :presence => true, :length => {:minimum => 1 , :maximum => 50 } 


	def self.types
		["EssayQuestion","DateQuestion","NumericQuestion","MultipleChoiceSingleQuestion","MultipleChoiceMultipleQuestion"]
	end
	
end


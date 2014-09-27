class Question < ActiveRecord::Base

	belongs_to :survey , :class_name => "Survey"
	has_one :option , :class_name => "Option" 
end

	
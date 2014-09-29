class Feedback < ActiveRecord::Base

	belongs_to :survey, :class_name => "Survey"
	belongs_to :user , :class_name => "User"

	has_many :answers , :class_name => "Answer"
end

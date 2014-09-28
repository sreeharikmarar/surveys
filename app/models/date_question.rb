class DateQuestion < Question
	belongs_to :survey , :class_name => "Survey"
end
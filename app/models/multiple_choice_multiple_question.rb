class MultipleChoiceMultipleQuestion < Question
	
   belongs_to :survey , :class_name => "Survey"
   has_one :option, :class_name => "Option" , :foreign_key  => "question_id"

end
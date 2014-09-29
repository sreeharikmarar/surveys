class MultipleChoiceSingleQuestion < Question
   
  has_one :option , :class_name => "Option" , :foreign_key => "question_id"

  accepts_nested_attributes_for :option , allow_destroy: true

end
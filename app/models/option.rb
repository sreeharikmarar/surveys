class Option < ActiveRecord::Base
	belongs_to :question, :class_name => "Question" ,:foreign_key  => "question_id"
end

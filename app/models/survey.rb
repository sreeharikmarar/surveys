class Survey < ActiveRecord::Base

	
	has_many :questions , :class_name => "Question" , :dependent => :destroy

	has_many :feedbacks , :class_name => "Feedback" , :dependent => :destroy

	accepts_nested_attributes_for :questions ,  allow_destroy: true
	accepts_nested_attributes_for :feedbacks ,  allow_destroy: true

	validates :title , :presence => true , :length => {:minimum => 1 ,:maximum => 100 }
	validates :description, :presence => true , :length => {:minimum => 1 , :maximum => 250 }

end

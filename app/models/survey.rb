class Survey < ActiveRecord::Base


  has_many :questions , :class_name => "Question" , :dependent => :destroy
  accepts_nested_attributes_for :questions ,  :allow_destroy => true , :reject_if => lambda { |a| a[:text].blank? }


  has_many :feedbacks , :class_name => "Feedback" , :dependent => :destroy
  accepts_nested_attributes_for :feedbacks ,  :allow_destroy => true

  has_many :options , :through => :questions


  validates :title , :presence => true , :length => {:minimum => 1 ,:maximum => 100 }
  validates :description, :presence => true , :length => {:minimum => 1 , :maximum => 250 }

  # validates :questions , :presence => true

end

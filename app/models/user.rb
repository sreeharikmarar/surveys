class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable , :confirmable

  has_many :feedbacks , :class_name => "Feedback"
  
  validates :username, :presence=>true, :length => {:minimum => 4 ,:maximum => 56}, :uniqueness => {:case_sensitive => false}
  
  validates_format_of :username, :with => /^[a-zA-Z1-9]*$/i ,:multiline => true
  
end

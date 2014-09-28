class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable , :confirmable

 # before_create  { generate_token(:confirmation_token) }

 # after_create :skip_confirmation
  validates :username, :presence=>true, :length => {:minimum => 4 ,:maximum => 56}, :uniqueness => {:case_sensitive => false}
  
  validates_format_of :username, :with => /^[a-zA-Z1-9]*$/i ,:multiline => true
  
    
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

 before_create  { generate_token(:confirmation_token) }


  validates :username, :presence=>true, :length => {:minimum => 4 ,:maximum => 56}, :uniqueness => {:case_sensitive => false}
  
  validates_format_of :username, :with => /^[a-zA-Z1-9]*$/i ,:multiline => true

  # validates_format_of :email , :with => /^([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})$/i , :multiline => true

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end

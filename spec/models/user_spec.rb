require 'rails_helper'

RSpec.describe User, :type => :model do
  describe User do

    

  	it "should create a valid user" do
      @user = FactoryGirl.create(:user) 
      @user.should be_valid
    end

    describe "email" do
    
      it "should require an email address" do
	      user = FactoryGirl.build(:user, :email => nil)
	      user.valid?
	      user.should_not be_valid
	      expect(user.errors[:email].size).to eq(1)
      end

      it "should check the format of email address" do
	      user = FactoryGirl.build(:user, :email => "invalid")
	      user.valid?
	      user.should_not be_valid
	      expect(user.errors[:email].size).to eq(1)
      end

      it "should check uniquness of email address" do
         user = FactoryGirl.create(:user)
	       dup_user = user.dup
	       dup_user.valid?
	       expect(dup_user.errors[:email].size).to eq(1)
	       expect(dup_user.errors[:email]).to eq(["has already been taken"])
      end

    end  

    describe "password" do

      it "should require a password" do
	      user = FactoryGirl.build(:user, :password => nil)
	      user.valid?
	      user.should_not be_valid
	      expect(user.errors[:password].size).to eq(1)
      end

      it "should check password length" do
	      user = FactoryGirl.build(:user, :password => "pass")
	      user.valid?
	      user.should_not be_valid
	      expect(user.errors[:password].size).to eq(1)
	      expect(user.errors[:password]).to eq(["is too short (minimum is 8 characters)"])
      end

    end

    describe "username" do

      it "should require a username" do
	      user = FactoryGirl.build(:user, :username => nil)
	      user.valid?
	      user.should_not be_valid
	      expect(user.errors[:username].size).to eq(2)
      end

      it "should check username length" do
	      user = FactoryGirl.build(:user, :username => "nam")
	      user.valid?
	      user.should_not be_valid
	      expect(user.errors[:username].size).to eq(1)
	      expect(user.errors[:username]).to eq(["is too short (minimum is 4 characters)"])
      end


      it "should check uniquness of username" do
         user = FactoryGirl.create(:user)
	       dup_user = user.dup
	       dup_user.valid?
	       expect(dup_user.errors[:username].size).to eq(1)
	       expect(dup_user.errors[:username]).to eq(["has already been taken"])
      end
    end

    describe "sign up process" do

    	before { ActionMailer::Base.deliveries = [] }
      before { @user = FactoryGirl.create(:user, :username =>"sample" ,:email => "sample@sample.com" , :password => "password")}

    	it "should create encrypted password" do
      		@user.encrypted_password.should_not be_blank 
    	end

    	it "should create confirmation token " do
      	@user.confirmation_token.should_not be_blank 
    	end

    	it "should send a confirmation mail" do
    		emails = []
  				ActionMailer::Base.deliveries.each do |m|
    			emails << m.to
  			end
  			ActionMailer::Base.deliveries.should_not be_empty
    		expect(emails).to include([@user.email])
    	end
  	end

  end
end

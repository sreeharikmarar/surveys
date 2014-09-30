require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
     	it "should send a confirmation mail after registration" do
    		user = FactoryGirl.create(:user, :username =>"sample" ,:email => "sample@sample.com" , :password => "password")
    		emails = []
  				ActionMailer::Base.deliveries.each do |m|
    			emails << m.to
  			end
  			ActionMailer::Base.deliveries.should_not be_empty
    		expect(emails).to include([user.email])
    	end
end

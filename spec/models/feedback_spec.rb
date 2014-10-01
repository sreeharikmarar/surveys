require 'rails_helper'

RSpec.describe Feedback, :type => :model do
  describe Feedback do


    	describe "while validating feedback" do

	  		it "should create a valid Feedback" do
	      		feedback = FactoryGirl.create(:feedback)
	      		feedback.should be_valid
	    	end

	    	it "shuld not save without a survey" do
	    		feedback = FactoryGirl.build(:feedback , :survey => nil)
	    		feedback.should_not be_valid
	    		expect(feedback.errors[:survey].count).to eq(1)
	    	end

	    	it "shuld not save without a user" do
	    		feedback = FactoryGirl.build(:feedback , :user => nil)
	    		feedback.should_not be_valid
	    		expect(feedback.errors[:user].count).to eq(1)
	    	end
    	end

    	describe "while saving feedback with answers" do

    		before :each do 
				@feedback = FactoryGirl.create(:feedback)
			end

    		it "should save a valid answer" do
	      		answer = FactoryGirl.build(:answer , :feedback => @feedback)
	      		answer.should be_valid
	    	end

    	end

    	describe "while saving feedback with date answer" do

    		before :each do 
				@feedback = FactoryGirl.create(:feedback)
			end

    		it "should create a valid Date answer" do
	      		answer = FactoryGirl.build(:date_answer , :feedback => @feedback)
	      		answer.should be_valid
	      		expect(answer.answer.to_date.class).to eq(Date)
	    	end

	    	it "should not create a date answer if the input is string" do
	      		answer = FactoryGirl.build(:date_answer , :feedback => @feedback)
	      		answer.answer = "invalid date"
	      		answer.should_not be_valid
	      		expect(answer.errors[:answer].count).to eq(1)
	    	end

    	end

    	describe "while saving feedback with Numeric answer" do

    		before :each do 
				@feedback = FactoryGirl.create(:feedback)
			end

    		it "should create a valid numeric answer" do
	      		answer = FactoryGirl.build(:numeric_answer , :feedback => @feedback)
	      		answer.should be_valid
	    	end

	    	it "should not create a numeric answer if the input is not numeric" do
	      		answer = FactoryGirl.build(:numeric_answer , :feedback => @feedback)
	      		answer.answer = "invalid"
	      		answer.should_not be_valid
	      		expect(answer.errors[:answer].count).to eq(1)
	    	end

    	end

    	describe "while saving feedback with Essay answer" do

    		before :each do 
				@feedback = FactoryGirl.create(:feedback)
			end

    		it "should create a valid numeric answer" do
	      		answer = FactoryGirl.build(:essay_answer , :feedback => @feedback)
	      		answer.should be_valid
	    	end

	    	it "should not create a essay answer if the charecter length is below 50" do
	      		answer = FactoryGirl.build(:essay_answer , :feedback => @feedback)
	      		answer.answer = "invalid"
	      		answer.should_not be_valid
	      		expect(answer.errors[:answer].count).to eq(1)
	    	end
    	end

    	describe "while saving feedback with multiple choice single answer" do

    		before :each do 
				@feedback = FactoryGirl.create(:feedback)
			end

    		it "should create a valid multiple choice single answer" do
	      		answer = FactoryGirl.build(:multiple_choice_single_answer , :feedback => @feedback)
	      		answer.should be_valid
	    	end

	    	it "should create a multiple choice single answer from the option" do
	      		answer = FactoryGirl.build(:multiple_choice_single_answer , :feedback => @feedback)
	      		answer.answer = "invalid choice"
	      		answer.should_not be_valid
	      		expect(answer.errors[:answer].count).to eq(1)
	    	end
    	end

    	describe "while saving feedback with multiple choice Multiple answer" do

    		before :each do 
				@feedback = FactoryGirl.create(:feedback)
			end

    		it "should create a valid multiple choice multiple answer" do
	      		answer = FactoryGirl.build(:multiple_choice_multiple_answer , :feedback => @feedback)
	      		answer.answer = ["choice 1","choice 2", ""]
	      		answer.should be_valid
	    	end

	    	it "should create a multiple choice multiple answer from the option" do
	      		answer = FactoryGirl.build(:multiple_choice_multiple_answer , :feedback => @feedback)
	      		answer.answer = ["invalid choice"]
	      		answer.should_not be_valid
	      		expect(answer.errors[:answer].count).to eq(1)
	    	end

	    	it "should create a multiple choice multiple answer from the option if params include empty string" do
	      		answer = FactoryGirl.build(:multiple_choice_multiple_answer , :feedback => @feedback)
	      		answer.answer = ["choice 1","choice 2", ""]
	      		answer.should be_valid
	      		expect(answer.errors[:answer].count).to eq(0)
	    	end
    	end


  end
end

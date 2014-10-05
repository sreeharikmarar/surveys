require 'rails_helper'

RSpec.describe Answer, :type => :model do
  
  	describe :answer do

  		before :each do 
				@feedback = FactoryGirl.create(:feedback)
		end

			
    	it "should save a valid answer" do
	      	answer = FactoryGirl.build(:answer , :feedback => @feedback)
	      	answer.should be_valid
	    end

	    describe "Date answer" do

		    it "should create a valid Date answer" do
		      		answer = FactoryGirl.build(:date_answer , :feedback => @feedback)
		      		answer.should be_valid
		      		expect(answer.value.to_date.class).to eq(Date)
		    end

		    it "should not create a date answer if the input is string" do
	      		answer = FactoryGirl.build(:date_answer , :feedback => @feedback)
	      		answer.value = "invalid date"
	      		answer.should_not be_valid
	      		expect(answer.errors[:value].count).to eq(1)
	    	end

		end

		describe "Numeric answer" do

			it "should create a valid numeric answer" do
	      		answer = FactoryGirl.build(:numeric_answer , :feedback => @feedback)
	      		answer.should be_valid
	    	end

	    	it "should not create a numeric answer if the input is not numeric" do
	      		answer = FactoryGirl.build(:numeric_answer , :feedback => @feedback)
	      		answer.value = "invalid"
	      		answer.should_not be_valid
	      		expect(answer.errors[:value].count).to eq(1)
	    	end

		end

		describe "Essay answer" do
			it "should create a valid numeric answer" do
	      		answer = FactoryGirl.build(:essay_answer , :feedback => @feedback)
	      		answer.should be_valid
	    	end

	    	it "should not create a essay answer if the charecter length is below 50" do
	      		answer = FactoryGirl.build(:essay_answer , :feedback => @feedback)
	      		answer.value = "invalid"
	      		answer.should_not be_valid
	      		expect(answer.errors[:value].count).to eq(1)
	    	end
		end

		describe "Multiple Choice Single answer" do

			before :each do 
				@survey = FactoryGirl.build(:survey)
			end

			it "should create a valid multiple choice single answer" do
				question = FactoryGirl.build(:multiple_choice_single_question , :survey => @survey)
    			question.options << FactoryGirl.create(:option)
    			answer = FactoryGirl.build(:multiple_choice_single_answer , :feedback => @feedback)
	      		expect(question.option_list.first.include?(answer.value)).to eq(true)
	    	end

	    end

		describe "Multiple choice multiple answer" do
			it "should create a valid multiple choice multiple answer" do
	      		question = FactoryGirl.build(:multiple_choice_multiple_question , :survey => @survey)
    			question.options << FactoryGirl.create(:option)
    			answer = FactoryGirl.build(:multiple_choice_multiple_answer , :feedback => @feedback)
	      		expect(question.option_list.first.include?(answer.value.sample)).to eq(true)
	    	end
		end
	end
end

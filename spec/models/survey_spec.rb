require 'rails_helper'

RSpec.describe Survey, :type => :model do
   describe Survey do

   		before :each do 
      		@survey = FactoryGirl.create(:survey)
    	end

  		it "should create a valid Survey" do
      		@survey.should be_valid
      		@survey.questions.should be_blank
    	end

    	it "should create a valid Survey with questions " do
    		FactoryGirl.create(:question, :survey => @survey)
      		@survey.should be_valid
      		@survey.questions.should_not be_blank
      		@survey.questions.last.option.should be_blank
    	end

    	it "should create a valid Survey with type Essay Question " do
    		FactoryGirl.create(:essay_question, :survey => @survey)
      		@survey.should be_valid
      		@survey.questions.last.should_not be_blank
      		@survey.questions.last.option.should be_blank
      		expect(@survey.questions.last.type).to eq("EssayQuestion")
      	end

    	it "should create a valid Survey with type Numeric Questions " do
    		FactoryGirl.create(:numeric_question, :survey => @survey)
      		@survey.should be_valid
      		@survey.questions.last.should_not be_blank
      		@survey.questions.last.option.should be_blank
      		expect(@survey.questions.last.type).to eq("NumericQuestion")
    	end

    	it "should create a valid Survey with type Date questions " do
    		FactoryGirl.create(:date_question, :survey => @survey)
      		@survey.should be_valid
      		@survey.questions.last.should_not be_blank
      		@survey.questions.last.option.should be_blank
      		expect(@survey.questions.last.type).to eq("DateQuestion")
    	end

    	it "should create a valid Survey with type Multiple Choice Multiple questions " do
    		FactoryGirl.create(:multiple_choice_multiple_question, :survey => @survey)
      		@survey.should be_valid
      		@survey.questions.last.should_not be_blank
      		@survey.questions.last.option.should_not be_blank
      		expect(@survey.questions.last.type).to eq("MultipleChoiceMultipleQuestion")
    	end

    	it "should create a valid Survey with type questions " do
    		FactoryGirl.create(:multiple_choice_single_question, :survey => @survey)
      		@survey.should be_valid
      		@survey.questions.last.should_not be_blank
      		@survey.questions.last.option.should_not be_blank
      		expect(@survey.questions.last.type).to eq("MultipleChoiceSingleQuestion")
    	end

    end
end

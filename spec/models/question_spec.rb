require 'rails_helper'

RSpec.describe Question, :type => :model do
    describe Question do

  		it "should create a valid question" do
      		question =  FactoryGirl.create(:question) 
      		question.should be_valid
      		question.option.should be_blank
    	end

    	describe "create Essay Question " do

    		it "should create a valid essay question" do
      			question =  FactoryGirl.create(:essay_question) 
      			question.should be_valid
      			question.survey.should_not be_blank
      			question.option.should be_blank
      			expect(question.type).to eq("EssayQuestion") 
    		end

    	end

    	describe "create Numerice Question " do

    		it "should create a valid essay question" do
      			question =  FactoryGirl.create(:numeric_question) 
      			question.should be_valid
      			question.survey.should_not be_blank
      			question.option.should be_blank
      			expect(question.type).to eq("NumericQuestion") 
    		end

    	end

    	describe "create Date Question " do

    		it "should create a valid essay question" do
      			question =  FactoryGirl.create(:date_question) 
      			question.should be_valid
      			question.survey.should_not be_blank
      			question.option.should be_blank
      			expect(question.type).to eq("DateQuestion") 
    		end

    	end

    	describe "create Multiple Choice Single Question with options " do

    		it "should create a valid multiple choice single question" do
      			question =  FactoryGirl.create(:multiple_choice_single_question) 
      			
      			question.should be_valid
      			question.survey.should_not be_blank
      			question.option.should_not be_blank
      			expect(question.type).to eq("MultipleChoiceSingleQuestion") 
    		end

    	end

    	describe "create Multiple Choice Multiple Question with options" do

    		it "should create a valid multiple choice single question" do
      			question =  FactoryGirl.create(:multiple_choice_multiple_question) 

      			question.should be_valid
      			question.survey.should_not be_blank
      			question.option.should_not be_blank
      			expect(question.type).to eq("MultipleChoiceMultipleQuestion") 

    		end

    	end
   end
end

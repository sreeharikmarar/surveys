class FeedbacksController < ApplicationController

	before_action :authenticate_user!
	
	def index
		@feedbacks = Feedback.all
	end

	def new
		@survey = Survey.find(params[:survey_id])
    	@feedback = Feedback.find_by_survey_id_and_user_id(@survey.id, current_user.id)
    	if @feedback
    		puts ">>>>>>>>>>>>>>>>>>>>>>>."
      		flash[:notice] = "You have already taken this survey."
      		redirect_to survey_feedback_path(@survey, @feedback)
    	else
      		@feedback = @survey.feedbacks.build
      		5.times { @feedback.answers.build }
    	end
	end

	def create

		@survey = Survey.find_by_id(params[:survey_id])
    	@feedback = Feedback.new(feedback_params)
    	@feedback.user = current_user

    	
      		if @feedback.save
      			flash[:notice] =  'Thanks for your feedback'
      			respond_to do |format|
        			format.html { redirect_to survey_feedback_path(@survey, @feedback) }
        		end
      		else
        		render :new
        	end
      
    end


	def edit
		@feedback = Feedback.find_by_id(params[:id])
		@survey = @feedback.survey
	end

	def update
		@feedback = Feedback.find(params[:id])

    	respond_to do |format|
      		if @feedback.update_attributes(feedback_params)
      			flash[:notice] =  'Your feedback has been updated successfully'
        		format.html { redirect_to survey_feedback_path(@feedback.survey, @feedback) }
      		else
        		render :edit
      		end
    	end
	end

	def show
		@feedback = Feedback.find(params[:id])
    	@survey = @feedback.survey
   	end

	private
    
  	def feedback_params
    	params.require(:feedback).permit!
  	end

end

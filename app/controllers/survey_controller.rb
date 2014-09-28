class SurveyController < ApplicationController

  # before_action :require_user

  def index

  end

  def new

    @survey = Survey.new
    @types = Question.types
    5.times {@survey.questions.build }

  end

  def create

    @survey = Survey.new survey_params
    
    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey }
      else
        @types = Question.types
        format.html { render :new }
      end
    end

  end

  def show

    @survey = Survey.find_by_id params[:id]
    @types = Question.types

  end

  def edit

    @survey = Survey.find_by_id params[:id]
    @types = Question.types

  end

  def update

    @survey = Survey.find_by_id(params[:id])
    
    respond_to do |format|
      if @Survey.update_attributes survey_params
        format.html { redirect_to @survey }
      else
        format.html { render :new }
      end
    end

  end

  def destroy

    @survey = Survey.find_by_id(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to survey_index_path }
    end
    
  end

  private
    
  def survey_params
    params.require(:survey).permit!
  end

  
end

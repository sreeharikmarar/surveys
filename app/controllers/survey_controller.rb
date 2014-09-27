class SurveyController < ApplicationController

  def index

  end

  def new
    @survey = Survey.new
    5.times {@survey.questions.build}

    @type = ["EssayQuestion","DateQuestion","NumericQuestion","MultipleChoiceSingle","MultipleChoiceMultiple"]
    @option = ["Single","Multiple"]
  end

  def create
    @survey = Survey.update_params survey_params
    if @survey.errors.blank?
      respond_to do |format|
        format.html { redirect_to @survey }
      end
    else
      respond_to do |format|
        format.html { render :new }
      end
    end
  end

  def show
    @survey = Survey.find_by_id params[:id]
  end

  def update

  end

  def destroy

  end

  private
    
  def survey_params
    params.require(:survey).permit!
  end

  
end

class HomeController < ApplicationController
  
  # before_action :require_user
  
  def index
  	@surveys = Survey.all
  end
  
end

class HomeController < ApplicationController
  
  def index
  	@surveys = Survey.all
  end
  
end

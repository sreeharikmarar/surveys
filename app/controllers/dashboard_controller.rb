class DashboardController < ApplicationController

	before_action :authenticate_user!

  	def index
  		@surveys = Survey.all
  	end
  
end

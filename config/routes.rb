Rails.application.routes.draw do
  

  controllers = {
      :registrations      => "registrations",
      :sessions           => "sessions"
  }

  devise_for :users , :controllers => controllers

  resources :survey do
  	resources :feedbacks
  end

  root 'home#index'

  get 'questions/index' , :as => "questions"

  get 'dashboard/index', :as => "dashboard"

end

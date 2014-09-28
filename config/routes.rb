Rails.application.routes.draw do
  

  controllers = {
      :registrations      => "registrations",
      :sessions           => "sessions"
  }

  devise_for :users , :controllers => controllers

  resources :survey

  root 'home#index'

  get 'questions/index' , :as => "questions"

  get 'dashboard/index', :as => "dashboard"

end

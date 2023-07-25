Rails.application.routes.draw do
  #resources student do
  resources :goals do
    resources :goal_questions
  end
  #end
  resources :experiences
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  root to: "welcome#index"
  get 'welcome/index'
end

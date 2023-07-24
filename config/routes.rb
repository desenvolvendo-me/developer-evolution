Rails.application.routes.draw do
  resources :objective_questions
  resources :objectives
  resources :experiences
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  root to: "welcome#index"
  get 'welcome/index'
end

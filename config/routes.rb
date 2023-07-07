Rails.application.routes.draw do
  resources :micro_goals
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  root to: "welcome#index"
  get 'welcome/index'
  #get "/microgoals", to:"micro_goals#index"
end

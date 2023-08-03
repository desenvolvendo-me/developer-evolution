Rails.application.routes.draw do
  resources :scripts do
    resources :script_questions
  end
  resources :interviews do
    resources :interview_videos
  end
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  root to: "welcome#index"
  get 'welcome/index'
end

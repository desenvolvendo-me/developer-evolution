Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  root to: "welcome#index"
  get 'welcome/index'

  resources :scripts do
    resources :script_questions
  end

  resources :interviews do
    resources :interview_videos
  end

  resources :tests do
    resources :tests_battles do
      resources :tests_issues
    end
  end

  resources :preparations do
    resources :preparations_releases do
      resources :preparations_issues
    end
  end
end

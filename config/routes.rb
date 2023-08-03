Rails.application.routes.draw do
  resources :interviews do
    resources :interview_videos
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  root to: "welcome#index"
  get 'welcome/index'

  resources :tests do
    resources :tests_battles do
      resources :tests_issues
    end
  end
end

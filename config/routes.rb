Rails.application.routes.draw do
  resources :micro_goals do
    resources :micro_goal_tasks
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  root to: "welcome#index"
  get 'welcome/index'
end

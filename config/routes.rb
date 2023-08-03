Rails.application.routes.draw do
  resources :objectives do
    resources :objective_questions
  end

  resources :experiences
  resources :micro_goals do
    resources :micro_goal_tasks, module: :micro_goals
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  root to: "welcome#index"
  get 'welcome/index'
end

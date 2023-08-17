Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  root to: "welcome#index"
  get 'welcome/index'

  resources :courses do
    resources :course_basics, module: :courses
  end

  resources :objectives do
    resources :objective_questions
  end

  resources :goals do
    resources :goal_questions, module: :goals
  end

  resources :experiences

end
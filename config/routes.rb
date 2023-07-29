Rails.application.routes.draw do
  resources :purposes do
    resources :purpose_questions, module: :purposes
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  root to: "welcome#index"
  get 'welcome/index'
end

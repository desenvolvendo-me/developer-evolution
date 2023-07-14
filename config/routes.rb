Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  root to: "welcome#index"
  get 'welcome/index'

  get ':login', to: 'students#show', as: :profile
  get ':login/ballast', to: 'students#ballast', as: :ballast
end

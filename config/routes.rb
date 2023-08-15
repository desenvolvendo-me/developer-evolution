Rails.application.routes.draw do
  resources :purposes do
    resources :purpose_questions, module: :purposes
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  root to: "welcome#index"
  
  get '/routines', to: 'routines#index', as: 'routines'
  post '/routines', to: 'routines#create', as: 'routines_create'
  get  '/routines/new', to: 'routines#new', as: 'new_routine'
  
  get '/routines/:id/pre_delete/', to: 'routines#pre_destroy', as: 'pre_destroy_routine'
  delete '/routines/:id', to: 'routines#destroy', as: 'delete_routine'

  get '/routines/:id', to: 'routines#show', as: 'show_routine'
  match '/routines/:id', to: 'routines#update', as: 'update_routine', via: [:post, :patch]
  get '/routines/:id/edit', to: 'routines#edit', as: 'edit_routine'
end
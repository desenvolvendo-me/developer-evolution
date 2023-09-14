Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  root to: "welcome#index"
  get 'welcome/index'
  get 'workouts/lesson'

  get ':login', to: 'students#show', as: :profile
  get ':login/edit', to: 'students#edit'
  patch ':login', to: 'students#update'
  get ':login/ballast', to: 'students#ballast', as: :ballast

  scope 'level' do
    scope 'zero' do
      resources :routines
      resources :objectives do
        resources :objective_questions
      end
      resources :goals do
       resources :goal_questions, module: :goals
      end  
    end
  end
  
  resources :thoughts
  resources :experiences

  resources :scripts do
    resources :script_questions
  end

  resources :interviews do
    resources :interview_videos
  end

  resources :purposes do
    resources :purpose_questions, module: :purposes
  end

  resources :courses do
    resources :course_basics, module: :courses
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
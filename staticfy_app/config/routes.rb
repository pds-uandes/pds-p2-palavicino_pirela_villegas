Rails.application.routes.draw do
  devise_for :users
  resources :users do
    member do
      patch 'promote_to_teacher'
      patch 'promote_to_student'
    end
  end

  resources :multi_choice_questions
  resources :tasks

  resources :courses do
    resources :tasks
  end

  resources :multi_choice_questions do
    post 'submit_answer', on: :member
  end

  resources :numeric_questions do
    post 'submit_answer', on: :member
    get 'show_hint', on: :member
    get 'show_result', on: :member
  end

  resources :user_progresses

  get '/home', to: 'static_pages#home'

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Root path route
  root "static_pages#home"
end

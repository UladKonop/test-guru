# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :user_tests, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
    resources :badges
  end

  resources :feedbacks, only: %i[new create]

  resources :badges, only: %i[index show]
end

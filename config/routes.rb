# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :user_tests, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests
  end
end

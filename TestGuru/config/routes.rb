Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sing_in: :login, sing_out: :logout }
  #get 'sessions/new'
  #get 'users/new'

  root 'tests#index'

  get :sign_out, to: 'sessions#destroy'

  resources :tests do
    resources :questions, shallow: true, exсept: :index do
      resources :answers, shallow: true, exсept: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests
  end
end

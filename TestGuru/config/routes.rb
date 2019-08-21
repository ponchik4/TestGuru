Rails.application.routes.draw do

  root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true, exept: :index do
      resources :answers, shallow: true, exept: :index
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

end

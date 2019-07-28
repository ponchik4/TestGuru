Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tests#index'

  resource :tests do
    resources :questions
  end

  get '/tests/questions/:id', to: 'questions#search'

end

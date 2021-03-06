Rails.application.routes.draw do
  resources :friendships
  resources :messages do
    collection do
      get 'received' => 'messages#index'
      get 'sent'
    end
  end
  resources :sessions, only: [:new, :create] # equivalent: get 'sign_up' => 'sessions#new' get 'sign_in' => 'sessions#create'
  resources :users
  root 'home#index'
  delete 'sign_out' => 'sessions#destroy'
  # We keep sessions#create for our regular login.
  # Let's use sessions#callback for Facebook login
  get 'auth/:provider/callback' => 'sessions#callback' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

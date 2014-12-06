Rails.application.routes.draw do
  root to: 'layouts#index'
  resources :restaurants, only: [:index], defaults: { format: :json }
  # post :restaurants, to: 'restaurants#index'
  get '*path' => 'layouts#index'
end

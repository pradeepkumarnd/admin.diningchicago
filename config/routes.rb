Rails.application.routes.draw do
  root to: 'layouts#index'
  # get '*path' => 'layouts#nothing'
  get '*path' => 'layouts#index'
end

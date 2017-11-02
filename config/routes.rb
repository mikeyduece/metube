Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :users, only: [:show]
  namespace :users do
    resources :playlists
  end
  resources :videos

  delete 'logout', to: 'sessions#destroy'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

end

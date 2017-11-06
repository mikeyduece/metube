Rails.application.routes.draw do
  root to: 'welcome#index'

  get 'favorites/:video_id/update', to: 'favorites#update', as: 'favorites_update'
  resources :users, only: [:show]
  resources :playlists
  resources :favorites
  resources :videos

  delete 'logout', to: 'sessions#destroy'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

end

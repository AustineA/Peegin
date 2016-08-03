Rails.application.routes.draw do
  devise_for :users
  #resources :peegins
  resources :peegins, only: [:new, :index]
  resources :peegins, :path=> '', except: [:new, :index]
post 'peegins' => 'peegins#create'

  root 'peegins#index'

end

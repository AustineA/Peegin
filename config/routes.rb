Rails.application.routes.draw do
  devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #resources :peegins
  resources :peegins, only: [:new, :index]
  resources :peegins, :path=> '', except: [:new, :index]
  resources :peegins do
    collection do
	     get 'search'
    end
    member do
	     get 'userpeegins'
    end
    member do
      put "like" => "peegins#upvote"
      put "dislike" => "peegins#downvote"
    end
  end
post 'peegins' => 'peegins#create'

get "/pages/:page" => "pages#show"

  root 'peegins#index'


end

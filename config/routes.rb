Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
      resources :peegins, only: [:new, :index]
      resources :peegins, :path=> '', except: [:new, :index]
      resources :peegins do
        collection do
    	     get 'search'
           get 'wod'
           get 'phrase'
           get 'random'
           get 'recent'
           get 'clean'
        end
        member do
    	     get 'userpeegins'
        end
        member do
          put "like" => "peegins#upvote"
          put "dislike" => "peegins#downvote"
        end
      end

      root 'peegins#index'
  end

  devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #resources :peegins
  resources :peegins, only: [:new, :index]
  resources :peegins, :path=> '', except: [:new, :index]
  resources :peegins do
    collection do
	     get 'search'
       get 'wod'
       get 'phrase'
       get 'random'
       get 'recent'
       get 'clean'
    end
    member do
	     get 'userpeegins'
    end
    member do
      put "like" => "peegins#upvote"
      put "dislike" => "peegins#downvote"
    end
  end

  authenticate :user, -> (user) { user.admin? } do
    mount Searchjoy::Engine, at: "searchjoy"
  end
post 'peegins' => 'peegins#create'

get "/pages/:page" => "pages#show"

  root 'peegins#index'


end

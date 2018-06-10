Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do

    namespace :kebe do

      resources :peegins, only: [:new, :index]
      resources :peegins, :path=> '', except: [:new, :index]
      resources :users, only: [:create]
      resource :session, only: [:create]do
        delete "/sign_out", :to => 'sessions#destroy'
      end


      resources :peegins do
        collection do
    	     get 'search'
           get 'wod'
           get 'phrase'
           get 'random'
           get 'recent'
           get 'clean'
           get 'explore'
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


    namespace :public do
      resources :peegins, only: [:search, :wod, :random, :recent] do
        collection do
          get 'search'
          get 'wod'
          get 'random'
          get 'recent'
      end
      member do
        put "like" => "peegins#upvote"
        put "dislike" => "peegins#downvote"
      end
    end
    end


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
       get 'explore'
       get 'glossary'
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

BeeMuic::Application.routes.draw do

  get "maps/edit"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :events do 
    resources :comments do
      member do
        put "like", to: "comments#upvote"
        put "unlike", to: "comments#unupvote"
        put "dislike", to: "comments#downvote"
        put "undislike", to: "comments#undownvote"
      end
    end
  end

  resources :faculties
  resources :event_types
  resources :locations
  resources :social_links
  resources :maps

  root  'events#index'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',          via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/createevent', to: 'events#new',       via: 'get'
  match '/feed',     to: 'static_pages#feed',   via: 'get'

end

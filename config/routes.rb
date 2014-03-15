BeeMuic::Application.routes.draw do
  get "events/new"
  get "faculties/new"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :faculties
  resources :events
  resources :relationships, only: [:create, :destroy]

  root  'events#index'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',          via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/mufaculties', to: 'faculties#new',    via: 'get'
  match '/createevent', to: 'events#new',       via: 'get'
  match '/feed',     to: 'static_pages#feed',   via: 'get'

end

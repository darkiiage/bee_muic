BeeMuic::Application.routes.draw do
  get "faculties/new"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :faculties

  root  'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',          via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/mufaculties', to: 'faculties#new',    via: 'get'

end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "lists#home"

  resources :lists, only: [:index, :show, :new, :create, :destroy] do
    resources :list_bookmarks, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :list_bookmarks, only: [:destroy]
  resources :movies, only: [:show] do
    resources :reviews, only: [:create]
  end
end

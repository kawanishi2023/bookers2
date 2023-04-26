Rails.application.routes.draw do

  # devise_for :books
  devise_for :users

  root to: "homes#top"

  resources :books, only: [:new, :index, :show, :create, :destroy, :edit, :update]

  resources :users, only: [:show, :edit, :index, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/home/about" => "homes#about", as: "about"

end

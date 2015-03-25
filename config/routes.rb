Rails.application.routes.draw do
  devise_for :users
  root :to => 'home#index'

  resources :users
  resources :questions do
    resources :answers, :except => [:show, :index]
  end

  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

end

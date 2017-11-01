Rails.application.routes.draw do

  resources :subs, except: [:show]

  resources :users, only: [:new, :create]

  resource :session, only: [:new, :create, :destroy]

  resources :subs, only: [:show] do
    resources :posts, only: [:create, :destroy]
  end

  root 'subs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

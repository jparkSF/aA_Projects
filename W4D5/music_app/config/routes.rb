Rails.application.routes.draw do



  resource :session
  resources :users
  resources :bands
  resources :albums


  root 'users#index'

  resources :bands, only: [:show] do
   resources :albums, only: [:new, :index, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

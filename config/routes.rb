Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "bitches#index"

  resources :users
  resources :bitches do
    resources :empathies, only: [:create, :destroy]
    member do
      get "change0", to: 'bitches#change0'
      get "change1", to: 'bitches#change1'
      get "change2", to: 'bitches#change2'
      get "change3", to: 'bitches#change3'
    end
  end
end

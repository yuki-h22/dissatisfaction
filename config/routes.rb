Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "bitches#index"

  resources :bitches do
    resources :empathies, only: [:create, :destroy]
  end
  # post 'empathies/:bitch_id/create', to: 'bitches#empathy_create', constraints: {bitch_id: /\d+/}, as: :empathy_create
  # post 'empathies/:bitch_id/delete', to: 'bitches#empathy_delete', constraints: {bitch_id: /\d+/}, as: :empathy_delete
end

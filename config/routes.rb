Rails.application.routes.draw do
  mount Knock::Engine => '/knock'

  resources :users, only: [:create, :show]
  resources :devices, only: [:create, :destroy, :update, :index, :show] do
    resources :messages, only: [:index, :show]
    resources :webhooks, only: [:create, :destroy, :index, :show, :update]
  end

  post 'devices/:id', to: 'devices#receive_message'
  get '/ping', to: 'system#ping'
end

Rails.application.routes.draw do
  mount Knock::Engine => '/knock'

  resources :users, only: [:create, :show, :update]
  resources :devices, only: [:create, :destroy, :update, :index, :show] do
    resources :messages, only: [:create, :index, :show]
    resources :webhooks, only: [:create, :destroy, :index, :show, :update]
  end
end

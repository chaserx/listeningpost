Rails.application.routes.draw do
  resources :devices, only: [:create, :destroy, :update, :index, :show] do
    resources :messages, only: [:create, :destroy, :index, :show]
    resources :callbacks, only: [:create, :destroy, :index, :update, :show]
    resources :webhooks, only: [:create, :destroy, :index, :show, :update]
  end
  post 'devices/:id' => 'messages#create'
end

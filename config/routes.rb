Rails.application.routes.draw do
  resources :devices, only: [:create, :destroy, :update, :index] do
    resources :messages, only: [:create, :destroy, :index]
    resources :callbacks, only: [:create, :destroy, :index, :update, :show]
  end
  post 'devices/:id' => 'messages#create'
end

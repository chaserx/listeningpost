Rails.application.routes.draw do
  resources :devices, only: [:create, :destroy, :index] do
    resources :messages, only: [:create, :destroy, :index]
    resources :callbacks, only: [:create, :destroy, :index, :show]
  end
  post 'devices/:id' => 'messages#create'
end

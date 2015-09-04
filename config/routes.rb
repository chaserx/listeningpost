Rails.application.routes.draw do
  mount Knock::Engine => '/knock'

  resources :users, only: [:create, :show, :update]
  resources :devices, except: [:new, :edit] do
    resources :messages, only: [:create, :index, :show]
    resources :webhooks, except: [:new, :edit]
  end
end

Rails.application.routes.draw do
  root to: 'login#show'

  resource :login, controller: :login

  resources :users

  resources :projects do
    resources :issues do
      post :close, on: :member
    end
  end

  resources :issues do
    post :close, on: :member
  end
end

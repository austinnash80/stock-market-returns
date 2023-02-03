Rails.application.routes.draw do
  resources :number_storages
  resources :stocks do collection {post :import} end
  resources :realizeds do collection {post :import} end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'pages/homepage'
  get 'pages/realized'
  get 'pages/stocks'
  get 'pages/number_storage'
end

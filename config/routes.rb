Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :items do
    resources :record_lists, only:[:index, :create]
  end
end

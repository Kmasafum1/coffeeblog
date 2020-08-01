Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts, only: [:index, :new, :create, :destroy, :show] do
    collection do
      get 'search'
    end  
    resources :likes, only: [:create, :destroy]
  end
  
  resources :users, only: [:index, :show]
end

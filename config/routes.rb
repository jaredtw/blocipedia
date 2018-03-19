Rails.application.routes.draw do
  devise_for :users

  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end

  resources :charges, only: [:new, :create]

  resources :users, only: [] do
    member do
      # get 'show'
      post 'downgrade'
    end
  end

  # match "users/:id/downgrade" => "users#downgrade", :as => "downgrade_user", via: [:get, :post]

  get 'welcome/index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

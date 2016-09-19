Rails.application.routes.draw do
  get 'notifications/index'

  get 'users/show'

  get 'proposals/index'

  get 'activities/index'

  devise_for :users
    root to: "pages#home"
    get 'search', to: 'activities#index'

  resources :users, only: [:index, :show, :edit, :update] do
    post 'follow' => 'following_relationships#create'
    delete 'follow' => 'following_relationships#destroy'
  end

  resources :activities, only: [:index] do
    resources :proposals, only: [:index, :show, :new, :create, :destroy]
  end

  resources :proposals, only: [] do
    member do
      post :upvote
    end
  end

  resources :proposals, only: [] do
    collection do
      get :autocomplete
    end
  end

  resources :notifications, only: [:index]

end


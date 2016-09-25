Rails.application.routes.draw do
  get 'notifications/index'

  # get 'users/show'

  # get 'proposals/index'

  # get 'activities/index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "pages#home"

  resources :users, only: [:index, :show, :edit, :update] do
    post 'follow' => 'following_relationships#create'
    delete 'follow' => 'following_relationships#destroy'
  end

  resources :activities, only: [:index] do
    resources :proposals, only: [:index, :show, :new, :create, :destroy]
    get '/proposals/search' => 'proposals#search', on: :collection #on cherche toutes les proposals de toutes les activitiés
  end                                                              #en arrivant sur une page spécifique

  resources :proposals, only: [] do
    post :upvote, on: :member
  end

  resources :proposals, only: [] do
    collection do
      get :autocomplete
    end
  end

  resources :notifications, only: [:index]

end


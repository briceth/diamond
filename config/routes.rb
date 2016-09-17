Rails.application.routes.draw do
  get 'users/show'

  get 'proposals/index'

  get 'activities/index'

  devise_for :users
    root to: "pages#home"
    get 'search', to: 'activities#index'

  resources :users, only: [:show, :edit, :update]

  resources :activities, only: [:index] do
    resources :proposals, only: [:index, :show, :new, :create, :destroy]
  end

  resources :proposals, only: [] do
    member do
      post :upvote
    end
  end


end


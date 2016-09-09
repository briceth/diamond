Rails.application.routes.draw do
  get 'activities/index'

  devise_for :users
    root to: "pages#home"
    get 'search', to: 'activities#index'

  resources :activities, only: [:index] do
    resources :proposals
  end
end


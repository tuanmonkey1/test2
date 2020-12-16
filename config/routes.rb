Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'staticpages#home'
  get 'pages/home', to: 'static_pages#home'
  get 'pages/help', to: 'static_pages#help'
  get 'pages/review', to: 'static_pages#review'
  resources :reviews, only: [:create, :destroy, :show, :new, :index] do
    collection { get :search, to: 'reviews#index' }
    resources :comments, only: [:index, :create]
    resources :rates, only: [:index, :create]
  end
end

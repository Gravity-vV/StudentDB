Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/y', as: 'rails_admin'
  resources :majors
  resources :groups
  resources :courses
  get 'welcome/index'
  resources :teachers do
    collection do
      get :gradeinputshow
      get :gradeinput
      get :coursesetshow
      get :courseset
    end
  end
  resources :students do
    collection do
      get :getstuwei
    end
  end
  root 'welcome#index'
  resources :search do
    collection do
      get :searchbysno
      get :searchbynm
      get :searchbymno
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

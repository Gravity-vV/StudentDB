Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/y', as: 'rails_admin'
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
  # scope '/majors' do
  #   resources :majors
  #   get '/majors/:id/addcourse', to: 'majors#addcourse'
  # end
  resources :majors do
    member do
      post '/addcourse', to: 'majors#addcoursepost', as: 'addcoursepost'
    end
    collection do
      get '/:id/addcourse', to: 'majors#addcourse', as: 'addcourse'
      get '/:id/showcoursesofmajor', to: 'majors#showcoursesofmajor', as: 'showcoursesofmajor'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

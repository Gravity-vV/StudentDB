Rails.application.routes.draw do
  resources :majors
  resources :groups
  resources :courses
  get 'welcome/index'
  resources :teachers do
    collection do
      get :gradeinputshow
      get :gradeinput
    end
  end
  resources :students
  root 'welcome#index'
  resources :search do
    collection do
      get :searchbysno
      get :searchbynm
      get :searchbymno
      # get :searchstuCSCG
      # get :searchstuavgGcpy
      # get :searchstuavgGall
      # get :searchstusT
      # get :searchstukai
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :majors
  resources :groups
  resources :courses
  get 'welcome/index'
  resources :teachers
  resources :students
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

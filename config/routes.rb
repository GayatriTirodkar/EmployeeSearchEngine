Rails.application.routes.draw do
  resources :sections
  resources :departments
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "departments#index"
end

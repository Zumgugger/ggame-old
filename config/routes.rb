Rails.application.routes.draw do


  resources :events
  resources :options
  resources :groups
  resources :targets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

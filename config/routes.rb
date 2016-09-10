Rails.application.routes.draw do

  get 'resets', to: 'resets#index', as: 'resets'
  post 'resets/target_count' => 'resets#target_count'
  post 'resets/group_reset' => 'resets#group_reset'
  post 'resets/target_reset' => 'resets#target_reset'
 
  root to: 'events#main'
  resources :events
  resources :options
  resources :groups
  resources :targets

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

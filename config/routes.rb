Rails.application.routes.draw do

  get 'api/settings'
  get 'api/count'
  get 'api/version'
  get 'api/start'
  get 'api/stop'
  get 'api/clear'
  get 'api/phone_count'
  post 'api/upload'
  resources :totalconfigs
  resources :statsps
  get "help/blves"

  resources :blves
  get 'cdr/index'

  get 'help/outgoing_destroy_all'

  resources :outgoings
  resources :sips
  get 'sip/show'

  get 'sip/edit'
  
  post 'sip/save'

  resources :settings
  #get 'settings/show'
  #get 'settings/edit'
  #post 'settings/edit'
  #get '/settings', to: 'settings#show'
  resources :tasks
  root 'sessions#new'
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'outgoings/destroy_all'
  get 'help/cdr'
  get 'help/cdr_clear'
  get 'help/channel_add'
  get 'help/channel_del'
end

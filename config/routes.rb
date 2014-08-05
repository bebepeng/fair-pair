Rails.application.routes.draw do
  root 'welcome#index'
  get 'timers' => 'timers#index'
  resources :users, :only => [:new, :create]
end

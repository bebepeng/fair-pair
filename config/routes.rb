Rails.application.routes.draw do
  root 'welcome#index'
  get 'timers' => 'timers#index'
  resources :users, :only => [:new, :create]
  resource :sessions, :only => [:new, :create, :destroy]
  resources :repos, :only => [:create, :index, :destroy]
end

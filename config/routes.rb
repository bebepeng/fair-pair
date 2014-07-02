Rails.application.routes.draw do
  root 'welcome#index'
  get 'timers' => 'timers#index'
end

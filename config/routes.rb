Rails.application.routes.draw do
  resources :articles
  resources :users, defaults: { format: :json }
  get 'homes/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

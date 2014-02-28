BillingWithStripe::Application.routes.draw do
  devise_for :users
  resources :charges

  resources :plans #creates a whole bunch of routes
  resources :subscriptions
  root 'home#index'

end

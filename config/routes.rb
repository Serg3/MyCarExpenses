Rails.application.routes.draw do

  root  to: 'transports#index'

  resources :transports

end

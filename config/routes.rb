Rails.application.routes.draw do

  root  to: 'transports#index'

  resources :transports, shallow: true do
    resources :expenses
  end

end

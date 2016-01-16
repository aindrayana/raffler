Rails.application.routes.draw do
  resources :entries, defaults: { format: :json }
  root "raffle#index"
end

Rails.application.routes.draw do

  resources :entries
  root "raffle#index"

end

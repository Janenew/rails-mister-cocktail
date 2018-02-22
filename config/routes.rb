Rails.application.routes.draw do
  resources :doses, only: [:destroy]
  resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
    resources :doses, only: [:new, :create]
    resources :ingredients, only: [:show]
  end

  root "cocktails#index"
end

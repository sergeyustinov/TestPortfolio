Rails.application.routes.draw do

  resources :users, only: [] do
    resources :projects, only: [:index]
  end

  root "projects#index"
end

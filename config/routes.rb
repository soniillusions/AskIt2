Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  resources :questions do
    resources :answers, only: [:create, :destroy, :edit, :update]
  end

  root "pages#index"
end

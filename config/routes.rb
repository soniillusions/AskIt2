Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :edit, :update]

  resources :questions do
    resources :answers, only: [:create, :destroy, :edit, :update]
  end

  root "pages#index"
end

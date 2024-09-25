Rails.application.routes.draw do
  resources :questions do
    resources :answers, only: [:create, :destroy]
  end

  root "pages#index"
end

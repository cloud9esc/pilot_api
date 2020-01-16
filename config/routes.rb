Rails.application.routes.draw do
  resources :reviews do
    resources :comments
  end

  resource :categories, only: [:index, :create, :update, :destroy]
end

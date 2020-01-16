Rails.application.routes.draw do
  resources :reviews do
    resources :comments
  end

  resource :categorys, only: [:index, :create, :update, :destroy]
end

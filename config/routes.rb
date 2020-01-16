Rails.application.routes.draw do
  resources :reviews do
    resources :comments
  end

  resources :categories, only: %i[index create update destroy]
end

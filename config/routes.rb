Rails.application.routes.draw do

  root 'home#index'
  get 'about' => "home#about"
  resources :posts do
    resources :comments, only: [:new, :create, :destroy]
    # resources :favorites, only: [:create, :destroy]
  end

end

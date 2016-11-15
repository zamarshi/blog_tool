Rails.application.routes.draw do

  root 'home#index'
  get 'about' => "home#about"
  resources :posts do
    resources :comments, only: [:new, :create, :destroy]
    # resources :favorites, only: [:create, :destroy]
  end
    resources :users, only: [:new, :create]

resources :sessions, only: [:new, :create, :destroy] do
  delete :destroy, on: :collection #this skips having an :id in the url
end
    

end

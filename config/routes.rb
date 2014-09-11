Rails.application.routes.draw do
  #after login on on facebook user geta sent back to this callback route and you have to tell rails which controller#action to hit
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:index, :show]
  root 'users#index'


  

end

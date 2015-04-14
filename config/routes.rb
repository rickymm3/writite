BaseApp::Application.routes.draw do

  resources :mystories do
    resources :chapters
  end


  # resources :topics do
  #   resources :replies
  # end

  root :to => "home#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "pages/index"
  get "/admin" => "admin/base#index", :as => "admin"
  namespace "admin" do
    resources :users
  end
  resources :users, only: [:show]

  get "pages/not_authorized"

end

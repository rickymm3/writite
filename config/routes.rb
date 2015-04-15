BaseApp::Application.routes.draw do

  resources :mystories do
    resources :chapters
  end

  resources :tag_lists

  root :to => "home#index"

  devise_for :users, controllers: {:omniauth_callbacks => "users/omniauth_callbacks"}

  get "pages/index"
  get "/admin" => "admin/base#index", :as => "admin"

  namespace "admin" do
    resources :users
  end

  resources :users, only: [:show] do
    resources :profiles
  end

  get "pages/not_authorized"

end

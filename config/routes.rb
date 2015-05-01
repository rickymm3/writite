BaseApp::Application.routes.draw do

  resources :mystories do
    resources :chapters
    member do
      get :publish
    end
  end

  resources :tags do
    collection do
      post :filter_tag
    end
  end

  root :to => "home#index"

  devise_for :users, controllers: {:omniauth_callbacks => "users/omniauth_callbacks",:registrations =>"users/registrations"}

  get "pages/index"
  get "/admin" => "admin/base#index", :as => "admin"

  namespace "admin" do
    resources :users
  end

  resources :users

  get "pages/not_authorized"

end

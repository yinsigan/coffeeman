Blog::Application.routes.draw do
  get "search/show"

  root :to => "home#index"

  devise_for :users

  resources :replies, :only => [:new, :create, :edit, :update]
  resources :topics, :only => [:index, :show, :new, :create, :edit, :update] do
    collection do
      get :newest
      get :my
    end
  end
  resources :tags

  resources :users do
    resources :topics
  end

  resource :search, :controller => 'search', :only => 'show'

  namespace :settings do
    resource :profile, :only => [:show, :update]
  end

  namespace :admin do
    get '/', :to => 'dashboard#show', :as => 'dashboard'
    resources :topics, :only => [:index, :show, :destroy]
    resources :replies, :only => [:index, :show, :destroy]
    resources :users, :only => [:index, :show, :destroy]
    resource  :site, :only => [:show, :update]
    resources :fragments
  end

end


Guitar::Application.routes.draw do
  resources :episodes
  resources :comments

  root :to => 'home#index'
  match "/artist" => "home#_artist"
  match "/tablar" => "home#_tablar"
  match "/tool" => "home#_artist"
  match "/bbs" => "home#_artist"
  match "/teacher" => "home#_artist"
  match "/map" => "home#_artist"


  devise_scope :user do
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation    
  end

  devise_for :users
    match 'users/bulk_invite/:quantity' => 'users#bulk_invite', :via => :get, :as => :bulk_invite
    resources :users, :only => [:show, :index] do
    get 'invite', :on => :member
  end
end

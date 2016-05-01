Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'dashboard#home'
  resources :users
  resources :broker_quotes
  resources :airlines
  resources :airline_quotes


  match "/sign_up_as_airplan" => "users#sign_up_as_airplan", :via => [:get, :post]
  get '/contact-us'  ,       :to => 'contacts#new'
  post '/contact-us'  ,       :to => 'contacts#create'
  get 'broker_board' => 'dashboard#broker_board'
  get 'demo' => 'dashboard#demo'
  get 'airplane_board' => 'dashboard#airplane_board'
  get 'load-board' => 'dashboard#load_board'
  post 'search_by_broker' => 'broker_quotes#search_by_broker'
  post 'add-bid' => "airline_quotes#user_bid"
  get 'broker-bids' => "users#broker_bids"
  get "bidded-quotes" => "airline_quotes#bidded_quotes"
  get "load-board" => "dashboard#load_board"

end

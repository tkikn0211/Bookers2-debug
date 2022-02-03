Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  get "/search", to: "searches#search"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    #resource :relationships, only: [:create, :destroy]　<= _relationships.html.erbがlink_toなのでgetを使う
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  post "follow/:id" => 'relationships#follow', as: 'follow'
  post "unfollow/:id" => 'relationships#unfollow', as: 'unfollow'
end

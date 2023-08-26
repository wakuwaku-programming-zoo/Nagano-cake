Rails.application.routes.draw do

  namespace :admin do
    resources :orders, only:[:show, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :genres, only:[:index, :edit, :create, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    get 'admin' => 'homes#top'
    resources :order_details, only:[:update]
  end
  namespace :public, path: '/' do
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    post 'orders/check' => 'orders#check'
    get 'orders/check' => 'orders#check'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only:[:new, :create, :index, :show]


    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only:[:index, :update, :destroy, :create]

    get 'customers/mypage' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
    get 'customers/check' => 'customers#check'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :items, only:[:index, :show]
    root to: 'homes#top'
    get 'about' => 'homes#about'
  end

  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

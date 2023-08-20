Rails.application.routes.draw do
  
  namespace :admin do
    resources :orders, only:[:show, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :genres, only:[:index, :edit, :create, :update]
    resources :items, only:[:index, :new, :create, :show, :edit]
    get 'admin' => 'homes#top'
  end
  namespace :public do
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    resources :orders, only:[:new, :create, :index, :show]
    get 'orders/complete' => 'orders#complete'
    post 'orders/check' => 'orders#check'
    resources :cart_items, only:[:index, :update, :destroy, :create]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
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

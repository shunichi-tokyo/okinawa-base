Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

 namespace :admin do
    root to: 'homes#top'
    resources :posts, only: [:index, :new, :create, :show, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
    #resources :orders, only: [:show]
    end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: 'homes#top'
    get 'users/check' => 'users#check', as: 'check'
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw'
    resources :users, only: [:show, :edit, :update]
    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

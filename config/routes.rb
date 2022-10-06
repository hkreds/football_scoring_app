Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: "homes#top"
    resources :customers, only: [:index,:show,:edit,:update] do
      member do
        get :follows, :followers
      end
      resource :relationships, only: [:create, :destroy]
    end
    patch 'customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw'
    resources :conventions, only: [:index,:show]
    resources :matches, only: [:show]
    resources :scorings do
      resources :comments, only: [:create]
    end
    resources :teams, only: [:index,:show]
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    root to: "homes#top"
    resources :customers, only: [:show,:edit,:update]
    resources :players, only: [:index,:create,:show,:edit,:update]
    resources :teams, only: [:index,:create,:show,:edit,:update]
    resources :affiliated_players, only: [:create,:edit,:update,:destroy]
    resources :conventions, only: [:index,:create,:show,:edit,:update]
    resources :participating_teams, only: [:create,:edit,:update,:destroy]
    resources :matches, only: [:index,:create,:show,:edit,:update]
    resources :competitors, only: [:create,:edit,:update,:destroy]
    resources :scorings, only: [:index,:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

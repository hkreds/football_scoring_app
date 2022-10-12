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
    post 'customers/guest_sign_in', to: 'customers#guest_sign_in', as: 'guest_sign_in'
    patch 'customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw'
    resources :conventions, only: [:index,:show]
    resources :matches, only: [:show] do
      resources :scorings, only: [:new]
    end
    resources :scorings, except: [:new] do
      resource :favorites, only: [:create, :destroy]
      resource :unfavorites, only: [:create, :destroy]
      resources :scoring_comments, only: [:create, :destroy]
    end
    resources :player_scoring, only: [:create,:update]
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
    resources :scorings, only: [:index,:show,:destroy] do
      resources :scoring_comments, only: [:destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

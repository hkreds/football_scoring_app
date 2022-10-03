Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    root to: "homes#top"
    patch 'customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw'
    resources :customers, only: [:index,:show,:edit,:update]
    resources :conventions, only: [:index,:show] do
      resources :matches, only: [:show] do
        resources :scorings, except: [:index] do
          resources :comments, only: [:create]
        end
      end
    end
    resources :scorings, only: [:index]
    resources :teams, only: [:index,:show]
  end
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

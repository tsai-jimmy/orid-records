Rails.application.routes.draw do
  devise_for :users

  resources :index, only: [:index]

  resources :orids

  namespace :admin do
    resources :orids
    resources :users do
      member do
        patch :promote
        patch :deomote
      end
    end
  end

  root 'welcome#index'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get('/', { to: 'welcome#index', as: 'home' })
  resources :ideas,shallow: true do
    resources :ideascomments, only: [:create,:destroy]
  end
  resources :scraps,shallow: true do
    resources :scrapscomments, only: [:create,:destroy]
  end
  resources :users
  resource :sessions, only: [:new, :destroy, :create]
end

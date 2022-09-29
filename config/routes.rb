Rails.application.routes.draw do
  namespace :admin do
    root "dashboards#index"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "top_page#top"

  get 'simulation_page', to: 'simulation#main'

  # root  'static_pages_controller#top'
  
  # resources :users, only: %i[new create]

  # #ログイン機能のためのルーティング
  # get 'login', to: 'user_sessions#new'
  # post 'login', to: 'user_sessions#create'
  # delete 'logout', to: 'user_sessions#destroy'
end

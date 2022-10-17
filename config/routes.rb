Rails.application.routes.draw do
 
  #ユーザー登録
  resources :users, only: %i[new create]

  #ログイン機能
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  #ユーザーページ
  resources :profiles, only: %i[show edit update]

  #管理者ページ
  namespace :admin do
    root "dashboards#index"
    resources :pierce_images, only: %i[index new edit create update destroy]
    
  end

  root "top_page#top"

  get 'simulation_page', to: 'simulation#main'

end

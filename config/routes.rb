Rails.application.routes.draw do
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  #ユーザー登録
  resources :users, only: %i[new create]

  #ログイン機能
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  #ユーザーページ
  resources :profiles, only: %i[show edit update]

  #パスワードリセット
  resources :password_resets, only: %i[new create edit update]

  #コーディネート画像機能
  resources :coordinate_images, only: %i[index show new create destroy] do
    collection do
      get 'bookmarks'
    end
  end
  get 'my_coordinate_images', to: 'coordinate_images#my_coordinate_image'

  #管理者ページ
  namespace :admin do
    root "dashboards#index"
    resources :pierce_images, only: %i[index new edit create update destroy]
  end

  #bookmark機能
  resources :bookmarks, only: %i[create destroy]

  root "top_page#top"

  get 'simulation_page', to: 'simulation#main'

end

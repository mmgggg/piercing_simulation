Rails.application.routes.draw do
  namespace :admin do
    get 'user_sessions/new'
    get 'user_sessions/create'
    get 'user_sessions/destroy'
  end
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  #ユーザー登録
  resources :users, only: %i[new create]

  #ログイン機能
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  #ユーザーページ
  resource :profiles, only: %i[show edit update]

  #パスワードリセット
  resources :password_resets, only: %i[new create edit update]

  #コーディネート画像機能
  resources :coordinate_images, only: %i[index show new create destroy] do
    collection do
      get 'bookmarks'
    end
  end
  get 'my_coordinate_images', to: 'coordinate_images#my_coordinate_image'
  get 'tag_images', to: 'coordinate_images#tag_images'

  #管理者ページ
  namespace :admin do
    root "dashboards#index"
    resources :pierce_images, only: %i[index new edit create update destroy]
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :users, only: %i[index show edit update destroy]
    resources :coordinate_images, only: %i[index show edit update destroy]
  end

  #bookmark機能
  resources :bookmarks, only: %i[create destroy]

  root "top_page#top"

  get 'simulation_page', to: 'simulation#main'

  #footerのURL作成
  get 'privacy_policy', to: 'footer#privacy_policy'
  get 'terms_of_service', to: 'footer#terms_of_service'

  #お問合せ機能
  resources :contacts, only: [:new, :create]
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'

end

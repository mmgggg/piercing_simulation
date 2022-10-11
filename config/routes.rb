Rails.application.routes.draw do
  #ユーザー登録
  resources :users, only: %i[new create]

  #管理者ページ
  namespace :admin do
    resources :pierce_images, only: %i[index new edit create update destroy]
    root "dashboards#index"
  end

  root "top_page#top"

  get 'simulation_page', to: 'simulation#main'

end

Rails.application.routes.draw do
  namespace :admin do
    resources :pierce_images, only: %i[index new edit create update destroy]
    root "dashboards#index"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "top_page#top"

  get 'simulation_page', to: 'simulation#main'

end

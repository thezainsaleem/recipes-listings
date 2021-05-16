Rails.application.routes.draw do
  default_url_options host: "localhost:3000"
  namespace :api, defaults: { format: :json } do
    namespace :v1  do
      resources :recipes, only: [:index, :show]
    end
  end
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories, only: [:create, :update]
      resources :events,     only: [:index,  :create, :update]

      get "/event", to: "events#event"
    end
  end
end

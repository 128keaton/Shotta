Rails.application.routes.draw do

  devise_for :users
  get 'screenshots/index'
  post 'screenshots/upload'
  post 'screenshots/delete'
  
  get "/view/:id" =>'viewer#index'
  get "/view", to: redirect('/')
  root to: "screenshots#index"
  
  namespace :api do
    namespace :v1 do
      as :user do
        post   "/sign-in"       => "sessions#create"
        delete "/sign-out"      => "sessions#destroy"
        get "/show"            => "api#show"
        post "/upload"        => "api#upload"
      end
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

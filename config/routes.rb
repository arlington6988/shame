Rails.application.routes.draw do
  resources :reviews
  resources :posts
  resource :wizard do
    get :step1
    get :step2
    get :step3
    get :step4

    post :validate_step
  end  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'reviews#index'
end

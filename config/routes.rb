Rails.application.routes.draw do
  root to: 'registrations#index'
  resources :registrations, only: [:index, :new, :create] do
    collection do
      get :confirm
      post :confirm
      get :finish
    end
  end
end

Datawings::Application.routes.draw do
  devise_for :users
  get "welcome/index"
  resources :data_transmissions do
    collection do
      post :create_by_sms
    end
  end

  resources :fireflies

  resources :hospitals

  resources :sponsors do
    get :fireflies
  end

  get :thanks, to: 'welcome#thanks'

  root 'welcome#index'
end

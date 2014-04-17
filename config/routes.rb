Datawings::Application.routes.draw do
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

  # You can have the root of your site routed with "root"
  root 'welcome#index'
end

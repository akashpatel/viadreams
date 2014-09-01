Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'quotes#index'

  resources :quotes, only: [:index, :show] do
    get 'random', on: :collection
    post 'update_likes', on: :collection
  end

  end

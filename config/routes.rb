Rails.application.routes.draw do
  resources :movies, only: [:show, :index], :defaults => {:format => :json}
  resources :locations, only: [:show, :index], :defaults => {:format => :json}
end

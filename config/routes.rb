Rails.application.routes.draw do
  resources :movies, only: [:show, :index], :defaults => {:format => :json}
end

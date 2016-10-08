Rails.application.routes.draw do
  resource  :session
  resources :examples

  resources :messages do
    resources :comments
  end

  root 'messages#index'
end

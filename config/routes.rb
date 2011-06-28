Rails.application.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :products do
      get 'restore', :on => :member 
    end
  end
end

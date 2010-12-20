# Put your extension routes here.

map.namespace :admin do |admin|
  admin.resources :products, :member => {:restore => :get}
end  

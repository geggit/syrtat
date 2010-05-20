ActionController::Routing::Routes.draw do |map|
  map.resources :photos

  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  # map.connect '', :controller => "welcome"

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':controller/service.wsdl', :action => 'wsdl'

  # MeetingPoint routes
  map.index '/', :controller => 'pages', 
                 :action => 'show',
                 :id => '1-Welcome'

  map.resources :pages
  map.resources :photos
  map.resources :tags

  map.resources :users, :member => { :enable => :put } do |users|
    users.resources :roles

    users.resources :tags, :name_prefix => 'user_', :controller => 'user_tags'
    users.resources :photos, :name_prefix => 'user_', :controller => 'user_photos',
                             :member => { :add_tag => :put, :remove_tag => :delete }
  end

  map.show_user '/user/:username', 
                 :controller => 'users',
                 :action => 'show_by_username'

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end

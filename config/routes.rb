ActionController::Routing::Routes.draw do |map|

  map.resources :assets
  map.connect '/', :controller => 'assets', :action => 'new'
  
end

ActionController::Routing::Routes.draw do |map|

  map.resources :assets
  
  map.index '/', :controller => 'assets', :action => 'new'
end

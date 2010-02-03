ActionController::Routing::Routes.draw do |map|
  map.root :controller => "home"
  map.resources :settings
  map.resources :users do |user|
    user.resources :settings, :controller => :user_settings
  end


  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

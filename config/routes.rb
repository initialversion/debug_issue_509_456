Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "ideas#index"
  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Venue resource:
  # CREATE
  get "/venues/new", :controller => "venues", :action => "new"
  post "/create_venue", :controller => "venues", :action => "create"

  # READ
  get "/venues", :controller => "venues", :action => "index"
  get "/venues/:id", :controller => "venues", :action => "show"

  # UPDATE
  get "/venues/:id/edit", :controller => "venues", :action => "edit"
  post "/update_venue/:id", :controller => "venues", :action => "update"

  # DELETE
  get "/delete_venue/:id", :controller => "venues", :action => "destroy"
  #------------------------------

  # Routes for the Venue_date_relation resource:
  # CREATE
  get "/venue_date_relations/new", :controller => "venue_date_relations", :action => "new"
  post "/create_venue_date_relation", :controller => "venue_date_relations", :action => "create"

  # READ
  get "/venue_date_relations", :controller => "venue_date_relations", :action => "index"
  get "/venue_date_relations/:id", :controller => "venue_date_relations", :action => "show"

  # UPDATE
  get "/venue_date_relations/:id/edit", :controller => "venue_date_relations", :action => "edit"
  post "/update_venue_date_relation/:id", :controller => "venue_date_relations", :action => "update"

  # DELETE
  get "/delete_venue_date_relation/:id", :controller => "venue_date_relations", :action => "destroy"
  #------------------------------

  # Routes for the Helpful_rating resource:
  # CREATE
  get "/helpful_ratings/new", :controller => "helpful_ratings", :action => "new"
  post "/create_helpful_rating", :controller => "helpful_ratings", :action => "create"

  # READ
  get "/helpful_ratings", :controller => "helpful_ratings", :action => "index"
  get "/helpful_ratings/:id", :controller => "helpful_ratings", :action => "show"

  # UPDATE
  get "/helpful_ratings/:id/edit", :controller => "helpful_ratings", :action => "edit"
  post "/update_helpful_rating/:id", :controller => "helpful_ratings", :action => "update"

  # DELETE
  get "/delete_helpful_rating/:id", :controller => "helpful_ratings", :action => "destroy"
  #------------------------------

  # Routes for the Photo resource:
  # CREATE
  get "/photos/new", :controller => "photos", :action => "new"
  post "/create_photo", :controller => "photos", :action => "create"

  # READ
  get "/photos", :controller => "photos", :action => "index"
  get "/photos/:id", :controller => "photos", :action => "show"

  # UPDATE
  get "/photos/:id/edit", :controller => "photos", :action => "edit"
  post "/update_photo/:id", :controller => "photos", :action => "update"

  # DELETE
  get "/delete_photo/:id", :controller => "photos", :action => "destroy"
  #------------------------------

  # Routes for the Review resource:
  # CREATE
  get "/reviews/new", :controller => "reviews", :action => "new"
  post "/create_review", :controller => "reviews", :action => "create"

  # READ
  get "/reviews", :controller => "reviews", :action => "index"
  get "/reviews/:id", :controller => "reviews", :action => "show"

  # UPDATE
  get "/reviews/:id/edit", :controller => "reviews", :action => "edit"
  post "/update_review/:id", :controller => "reviews", :action => "update"

  # DELETE
  get "/delete_review/:id", :controller => "reviews", :action => "destroy"
  #------------------------------

  # Routes for the Idea resource:
  # CREATE
  get "/ideas/new", :controller => "ideas", :action => "new"
  post "/create_idea", :controller => "ideas", :action => "create"

  # READ
  get "/ideas", :controller => "ideas", :action => "index"
  get "/ideas/:id", :controller => "ideas", :action => "show"

  # UPDATE
  get "/ideas/:id/edit", :controller => "ideas", :action => "edit"
  post "/update_idea/:id", :controller => "ideas", :action => "update"

  # DELETE
  get "/delete_idea/:id", :controller => "ideas", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

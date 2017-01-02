Rails.application.routes.draw do
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

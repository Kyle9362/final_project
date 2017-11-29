Rails.application.routes.draw do
  # Routes for the Prescription resource:
  # CREATE
  get "/prescriptions/new", :controller => "prescriptions", :action => "new"
  post "/create_prescription", :controller => "prescriptions", :action => "create"

  # READ
  get "/prescriptions", :controller => "prescriptions", :action => "index"
  get "/prescriptions/:id", :controller => "prescriptions", :action => "show"

  # UPDATE
  get "/prescriptions/:id/edit", :controller => "prescriptions", :action => "edit"
  post "/update_prescription/:id", :controller => "prescriptions", :action => "update"

  # DELETE
  get "/delete_prescription/:id", :controller => "prescriptions", :action => "destroy"
  #------------------------------

  devise_for :doctors
  # Routes for the Doctor resource:
  # READ
  get "/doctors", :controller => "doctors", :action => "index"
  get "/doctors/:id", :controller => "doctors", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

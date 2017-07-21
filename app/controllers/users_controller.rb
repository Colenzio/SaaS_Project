class UsersController < ApplicationController 
  # Devise way of user auth
  # User has to be logged in
  before_action :authenticate_user!
  
  # GET to /users/:id
  def show
    @user = User.find( params[:id] )
  end
  
end

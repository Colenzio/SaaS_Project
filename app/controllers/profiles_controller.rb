class ProfilesController < ApplicationController
  
  # GET to users/:user_id/profile/new
  def new
    # Render blank profile details form
    @profile = Profile.new
  end
  
  # POST to users/:user_id/profile
  def create
    # Ensure we have the user that is filling out form
    @user =  User.find( params[:user_id] )
    # Build out a profile in memory using whitelisted details below
    @profile = @user.build_profile( profile_params )
    if @profile.save
      flash[:success] = "Profile Updated"
      # redirect user to their profile page 
      redirect_to user_path(id: params[:user_id] )
    else
      render action: :new
    end
  end
  
  # GET to /users/:user_id/profile/edit
  def edit 
    @user = User.find( params[:user_id] )
    @profile = @user.profile
  end
  
  # PUT to /users/:user_id/profile
  def update
    # Get user id from db
    @user = User.find( params[:user_id] )
    # get user profile
    @profile = @user.profile
    # Mass assigned new details 
   if  @profile.update_attributes(profile_params)
     # flash success message
     flash[:success] = "Profile Updated!"
     # Redirect user to their profile page
     redirect_to user_path(id: params[:user_id] )
   else
     # If fails, render edit action again
     render action: :edit
   end
  end
  
  private 
  
  # Whitelist these params, only these things can be exepted into DB
   def profile_params
     params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
   end
end
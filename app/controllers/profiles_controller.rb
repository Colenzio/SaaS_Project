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
      redirect_to user_path( params[:user_id] )
    else
      render action: :new
    end
  end
  
  private 
  
  # Whitelist these params, only these things can be exepted into DB
   def profile_params
     params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
   end
end
class Users::RegistrationsController < Devise::RegistrationsController
  
  
  before_action :select_plan, only: :new
  
  def create
    # super inherits the create action, but extend it
    super do |resource|
      # finds plan in url
      if params[:plan]
        # take resource (user) set it which ever plan the params say
        resource.plan_id = params[:plan]
        # if they are plan 2, save them with subscription
        if resource.plan_id == 2
          resource.save_with_subscription
        # otherwise just save them
        else 
          resource.save
        end
      end
    end
  end
  
 private
  def select_plan
    unless (params[:plan] == '1' || params[:plan] == '2')
      flash[:notice] = "Please select a membership plan to sign up."
      redirect_to root_url
    end
  end
end
  
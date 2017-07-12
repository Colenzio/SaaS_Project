class Users::RegistrationsController < Devise::RegistrationsController
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
end

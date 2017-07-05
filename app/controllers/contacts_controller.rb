class ContactsController < ApplicationController
  #executes when contact action is run
  #create new instance variable
  def new
    @contact = Contact.new
  end
  #Use the create action to save something to a DB by default in rails
  def create
    #saving details from form and apply to @contact
    #mass assignment
    @contact = Contact.new(contact_params)
    #.save saves to DB
    #if save successful, redirect user back to blank page with message
    if @contact.save
      flash[:success] = "Message Sent"
      redirect_to new_contact_path
    #if it fails also redirect back but show fail message
    else 
      #if there is an error, the @contact will produce a set of errors in array form
      #.errors will allow us to access the errors
      #.full_messages make them better english
      #.join(", ") then takes out each error and forms them into sentences
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end
  
  private
  #take anything from form fields securely 
   def contact_params
     params.require(:contact).permit(:name, :email, :comments)
   end
end
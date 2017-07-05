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
      redirect_to new_contact_path, notice: "Message Sent."
    #if it fails also redirect back but show fail message
    else 
      redirect_to new_contact_path, notice: "Error Occured."
    end
  end
  
  private
  #take anything from form fields securely 
   def contact_params
     params.require(:contact).permit(:name, :email, :comments)
   end
end
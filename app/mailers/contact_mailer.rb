#file to send contact details to my email
#inherits ActionMailer 
class ContactMailer < ActionMailer::Base
  default to: "davidcolenzio@hotmail.com"

  
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
    
    mail(from: email, subject: 'Contact Form Message')
  end
end
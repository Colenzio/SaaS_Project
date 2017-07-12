class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 # Each user should belong to a planrail
 belongs_to :plan
 
 # allows us to grab the data from the form (whitelist)
 attr_accessor :stripe_card_token
 # send a call to stripe, charge user card, call us back, and return an object
 def save_with_subscription
   if valid?
     customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
     # save customer id in DB with response
     self.stripe_customer_token = customer.id 
     # runs save
     save!
   end
 end
end

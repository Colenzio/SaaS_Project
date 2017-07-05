class Contact < ActiveRecord::Base
  #validates from to be filled out
  validates :name, presence: true
  validates :email, presence: true
  validates :comments, presence: true
end
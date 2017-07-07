class Plan < ActiveRecord::Base
  # Both plans have many users
  has_many :users
end
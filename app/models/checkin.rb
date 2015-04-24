class Checkin < ActiveRecord::Base
  
  # Associations
  # You can only check in an item stored
  belongs_to :item
  
  # You can only check out a checked in item ONCE
  has_one :checkout
   
end

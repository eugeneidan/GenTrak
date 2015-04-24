class Checkout < ActiveRecord::Base
  
  #Associations
  # You can only checkout an item that has been checked in
  belongs_to :checkin
  
end

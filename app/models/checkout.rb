class Checkout < ActiveRecord::Base
  
  #Associations
  # You can only checkout an item that has been checked in
  belongs_to :checkin
  
  
  #def self.find_checkin(serial_no)
  #  #code
  #end
end

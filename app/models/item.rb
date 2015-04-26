class Item < ActiveRecord::Base

  # Validations
  validates :name, :item_type, presence: true, format: { with: /\A[a-z\sA-Z]+\z/,
    message: "only allows letters" }

  # Associations
  has_many :checkins

  def name_with_id
    "#{name}"
  end
  
  # check the total of each item
  def check_total
    return self.checkins.count      
  end 
  
  def self.printer
    where(name: 'zebra card printer')
  end
  
  def self.hardware
    where(item_type: 'hardware')
  end
  
  def self.consumable
    where(item_type: 'consumable')
  end
  
  def self.spares
    where(item_type: 'spares')
  end

end

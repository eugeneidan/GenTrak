class Checkin < ActiveRecord::Base
  
  #Associations
  belongs_to :item

  #Validations
  validates :waybillNo, length: { in: 6..8}, if: :is_applicable?
  validates :serialNo, format: { with: /^[zZ][3][jJ][1][0-9]{8}/, multiline: true }, if: :is_item_printer?
  validates :serialNo, :sentBy, :item, presence: true

  
  # Find out if item of this checkin is a card printer
  def is_item_printer?
    if !self.item.nil?
        # check the name of the item
        self.item.name.downcase == "zebra card printer"    
    end    
  end
  
  def is_applicable?
    if self.source.nil?
        # check the source of the item
        self.source.downcase != "hsb"
    end    
  end
  
end
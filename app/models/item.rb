class Item < ActiveRecord::Base
  
  validates :name, :item_type, presence: true, format: { with: /\A[a-z\sA-Z]+\z/,
    message: "only allows letters" }
  
end

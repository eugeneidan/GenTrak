class Item < ActiveRecord::Base

  validates :name, :item_type, presence: true, format: { with: /\A[a-z\sA-Z]+\z/,
    message: "only allows letters" }

  has_many :check_ins

  def name_with_id
    "#{name}"
  end

end

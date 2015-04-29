class AddCheckedOutToCheckins < ActiveRecord::Migration
  def change
    add_column :checkins, :checked_out, :boolean
  end
end

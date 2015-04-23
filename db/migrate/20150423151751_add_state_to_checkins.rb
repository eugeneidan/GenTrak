class AddStateToCheckins < ActiveRecord::Migration
  def change
    add_column :checkins, :state, :string
  end
end

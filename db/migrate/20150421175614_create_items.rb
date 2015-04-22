class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :desc
      t.integer :unit_px
      t.integer :total_qty
      t.string :code
      t.string :item_type

      t.timestamps null: false
    end
  end
end

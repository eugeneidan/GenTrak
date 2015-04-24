class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.date :dateOut
      t.references :checkin, index: true, foreign_key: true
      t.string :state
      t.string :destination
      t.string :purpose
      t.string :serial_no
      t.string :dispatchedBy
      t.string :receivedBy
      t.string :waybillNo

      t.timestamps null: false
    end
  end
end

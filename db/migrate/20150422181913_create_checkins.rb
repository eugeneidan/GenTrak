class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.datetime :dateIn
      t.references :item, index: true, foreign_key: true
      t.string :source
      t.string :purpose
      t.string :serialNo
      t.string :waybillNo
      t.string :receivedBy
      t.string :sentBy

      t.timestamps null: false
    end
  end
end

class CreateShops < ActiveRecord::Migration
  def self.up
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :postal_code
      t.time :opening_time
      t.time :closing_time
      t.string :holiday
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :shops
  end
end

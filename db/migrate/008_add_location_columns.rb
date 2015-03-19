class AddLocationColumns < ActiveRecord::Migration
  def self.up
    add_column :shops, :lat, :float
    add_column :shops, :lng, :float
  end

  def self.down
    remove_column :shops, :lat
    remove_column :shops, :lng
  end
end

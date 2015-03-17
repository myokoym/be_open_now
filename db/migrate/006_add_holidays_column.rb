class AddHolidaysColumn < ActiveRecord::Migration
  def self.up
    add_column :shops, :holidays, :string
  end

  def self.down
    remove_column :shops, :holidays
  end
end

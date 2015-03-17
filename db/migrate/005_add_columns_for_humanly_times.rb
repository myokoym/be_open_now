class AddColumnsForHumanlyTimes < ActiveRecord::Migration
  def self.up
    add_column :shops, :weekday, :string
    add_column :shops, :saturday, :string
    add_column :shops, :sunday, :string
  end

  def self.down
    remove_column :shops, :weekday
    remove_column :shops, :saturday
    remove_column :shops, :sunday
  end
end

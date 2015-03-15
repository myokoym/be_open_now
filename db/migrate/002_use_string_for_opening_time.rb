class UseStringForOpeningTime < ActiveRecord::Migration
  def self.up
    change_column :shops, :opening_time, :string
    change_column :shops, :closing_time, :string
  end

  def self.down
    change_column :shops, :opening_time, :time
    change_column :shops, :closing_time, :time
  end
end

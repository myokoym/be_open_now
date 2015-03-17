class UseBithourForTimes < ActiveRecord::Migration
  def self.up
    add_column :shops, :bithour, :string
    remove_column :shops, :weekday_opening_time
    remove_column :shops, :weekday_closing_time
    remove_column :shops, :weekday_opening_time2
    remove_column :shops, :weekday_closing_time2
    remove_column :shops, :saturday_opening_time
    remove_column :shops, :saturday_closing_time
    remove_column :shops, :saturday_opening_time2
    remove_column :shops, :saturday_closing_time2
    remove_column :shops, :sunday_opening_time
    remove_column :shops, :sunday_closing_time
    remove_column :shops, :holidays
  end

  def self.down
    remove_column :shops, :bithour
    add_column :shops, :weekday_opening_time, :string
    add_column :shops, :weekday_closing_time, :string
    add_column :shops, :weekday_opening_time2, :string
    add_column :shops, :weekday_closing_time2, :string
    add_column :shops, :saturday_opening_time, :string
    add_column :shops, :saturday_closing_time, :string
    add_column :shops, :saturday_opening_time2, :string
    add_column :shops, :saturday_closing_time2, :string
    add_column :shops, :sunday_opening_time, :string
    add_column :shops, :sunday_closing_time, :string
    add_column :shops, :holidays, :string
  end
end

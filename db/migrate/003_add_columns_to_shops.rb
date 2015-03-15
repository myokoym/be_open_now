class AddColumnsToShops < ActiveRecord::Migration
  def self.up
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
    add_column :shops, :tags, :string
    add_column :shops, :holidays, :string
    remove_column :shops, :opening_time
    remove_column :shops, :closing_time
    remove_column :shops, :holiday
  end

  def self.down
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
    remove_column :shops, :tags
    remove_column :shops, :holidays
    add_column :shops, :opening_time, :string
    add_column :shops, :closing_time, :string
    add_column :shops, :holiday, :string
  end
end

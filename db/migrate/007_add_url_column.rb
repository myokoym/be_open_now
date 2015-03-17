class AddUrlColumn < ActiveRecord::Migration
  def self.up
    add_column :shops, :url, :string
  end

  def self.down
    remove_column :shops, :url
  end
end

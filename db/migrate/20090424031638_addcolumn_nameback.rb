class AddcolumnNameback < ActiveRecord::Migration
  def self.up
    add_column(:frogs, :name, :string, :limit => 140)
  end

  def self.down
    remove_column(:frogs, :name)
  end
end

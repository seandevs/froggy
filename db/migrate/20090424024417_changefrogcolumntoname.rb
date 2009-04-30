class Changefrogcolumntoname < ActiveRecord::Migration
  def self.up
    rename_column :frogs, :frog, :name
  end

  def self.down
    rename_column :frogs, :name, :frog
  end
end

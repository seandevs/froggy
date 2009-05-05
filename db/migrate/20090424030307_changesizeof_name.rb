class ChangesizeofName < ActiveRecord::Migration
  def self.up
    change_column :frogs, :name, :string, :limit => 140
  end

  def self.down
    change_column :frogs, :name, :string
  end
end

class ChangestoName < ActiveRecord::Migration
  def self.up
    remove_column(:frogs, :name)
  end

  def self.down
    add_column(:frogs, :name)
  end
end

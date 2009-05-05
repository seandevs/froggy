class ChangeIdeastoFrogs < ActiveRecord::Migration
  def self.up
    rename_table :ideas, :frogs
  end

  def self.down
    rename_table :frogs, :ideas
  end
end

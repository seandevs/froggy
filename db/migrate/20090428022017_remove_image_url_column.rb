class RemoveImageUrlColumn < ActiveRecord::Migration
  def self.up
    remove_column :users, :image_url
  end

  def self.down
    add column :users, :image_url, :string
  end
end

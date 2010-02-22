class AddProgressIdToAssets < ActiveRecord::Migration
  def self.up
    add_column :assets, :uuid, :string
    add_index :assets, :uuid
  end

  def self.down
    remove_index :assets, :uuid
    remove_column :assets, :uuid
  end
end
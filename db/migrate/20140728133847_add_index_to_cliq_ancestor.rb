class AddIndexToCliqAncestor < ActiveRecord::Migration
  def up
    add_index :cliqs, :ancestry
  end
  def down
    remove_index :cliqs, :ancestry
  end
end

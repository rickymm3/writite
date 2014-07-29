class AddAncestryToCliqs < ActiveRecord::Migration
  def change
    add_column :cliqs, :ancestry, :string
  end
end

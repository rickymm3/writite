class AddColumnToCliqs < ActiveRecord::Migration
  def change
    add_column :cliqs, :is_main, :boolean
  end
end

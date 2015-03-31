class AddColorToCliq < ActiveRecord::Migration
  def change
    add_column :cliqs, :color, :string, default: "ffffff"
  end
end

class AddCreatedAtUpdateAtToCliq < ActiveRecord::Migration
  def change
    change_table(:cliqs) { |t| t.timestamps }
  end
end

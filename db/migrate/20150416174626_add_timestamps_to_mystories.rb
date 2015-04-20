class AddTimestampsToMystories < ActiveRecord::Migration
  def change
    change_table(:mystories) { |t| t.timestamps }
  end
end

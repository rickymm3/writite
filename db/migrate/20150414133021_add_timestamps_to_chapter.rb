class AddTimestampsToChapter < ActiveRecord::Migration
  def change
    change_table(:chapters) { |t| t.timestamps }
  end
end

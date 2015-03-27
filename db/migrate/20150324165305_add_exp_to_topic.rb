class AddExpToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :exp, :integer, :null => false, :default => 0
  end
end

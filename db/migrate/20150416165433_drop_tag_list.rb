class DropTagList < ActiveRecord::Migration
  def change
    drop_table :tag_lists
  end
end

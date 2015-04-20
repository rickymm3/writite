class DropTagListMyStories < ActiveRecord::Migration
  def change
    drop_table :tag_list_mystories
  end
end

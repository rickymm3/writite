class DropColumnMystoryIdFromTagLists < ActiveRecord::Migration
  def change
    remove_column :tag_lists, :mystory_id

  end
end

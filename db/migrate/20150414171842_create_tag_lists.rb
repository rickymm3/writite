class CreateTagLists < ActiveRecord::Migration
  def change
    create_table :tag_lists do |t|
      t.string :tag
      t.integer :mystory_id
      t.timestamps null: false
    end
  end
end

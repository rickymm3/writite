class CreateTagListMystories < ActiveRecord::Migration
  def change
    create_table :tag_list_mystories do |t|
      t.integer :tag_list_id
      t.integer :mystory_id

      t.timestamps null: false
    end
  end
end

class CreateTagsMystories < ActiveRecord::Migration
  def change
    create_table :tags_mystories do |t|
      t.integer :tag_id
      t.integer :mystory_id

      t.timestamps null: false
    end
  end
end

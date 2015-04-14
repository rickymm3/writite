class CreateChaptersTable < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :mystory_id
      t.text :chapter_text
    end
  end
end

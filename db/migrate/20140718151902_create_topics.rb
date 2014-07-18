class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :subject
      t.text :body
      t.integer :user_id
      t.integer :cliq_id

      t.timestamps
    end
  end
end

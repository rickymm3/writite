class CreateFollowing < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :parent_id
      t.integer :user_id
      t.integer :topic_id
      t.timestamps
    end
  end
end

class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :parent_id
      t.integer :user_id
      t.integer :cliq_id
      t.timestamps
    end
  end
end


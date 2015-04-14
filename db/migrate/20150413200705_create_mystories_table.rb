class CreateMystoriesTable < ActiveRecord::Migration
  def change
    create_table :mystories do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.integer :category
      t.integer :language
      t.boolean :mature
    end
  end
end

class AddSlugToUser < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string
    add_column :users, :about, :text
    add_column :users, :location, :string
    add_column :users, :website, :string
    add_index :users, :slug, unique: true
  end
end

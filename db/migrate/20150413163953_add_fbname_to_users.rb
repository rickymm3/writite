class AddFbnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fbname, :string
  end
end

class AddCoverToMystories < ActiveRecord::Migration
  def change
    add_column :mystories, :image_id, :string
  end
end

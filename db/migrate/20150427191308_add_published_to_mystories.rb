class AddPublishedToMystories < ActiveRecord::Migration
  def change
    add_column :mystories, :published, :boolean,:default => false
  end
end

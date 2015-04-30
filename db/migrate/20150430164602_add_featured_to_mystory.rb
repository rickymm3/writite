class AddFeaturedToMystory < ActiveRecord::Migration
  def change
    add_column :mystories, :featured, :boolean
    add_column :mystories, :featured_date, :datetime
  end
end

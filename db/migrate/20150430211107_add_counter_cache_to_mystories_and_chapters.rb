class AddCounterCacheToMystoriesAndChapters < ActiveRecord::Migration
  def change
    add_column :mystories, :impressions_count, :integer, default: 0
    add_column :chapters, :impressions_count, :integer, default: 0
  end
end

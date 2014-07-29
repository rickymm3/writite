class DropCliqReCreateCliq < ActiveRecord::Migration
  def change
    drop_table :cliqs
    create_table :cliqs do |t|
      t.integer :parent_id
      t.string :name, null: false
      t.boolean :is_category, default: false
    end
  end
end

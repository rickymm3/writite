class CreateCliqsTable < ActiveRecord::Migration
  def change
    create_table :cliqs do |t|
      t.integer :parent_id
      t.integer :lftp, null: false
      t.integer :lftq, null: false
      t.integer :rgtp, null: false
      t.integer :rgtq, null: false
      t.decimal :lft, precision: 31, scale: 30, null: false
      t.decimal :rgt, precision: 31, scale: 30, null: false
      t.string :name, null: false
      t.boolean :is_category, default: false
    end
    add_index :cliqs, :parent_id
    add_index :cliqs, :lftp
    add_index :cliqs, :lftq
    add_index :cliqs, :lft
    add_index :cliqs, :rgt
    add_index :cliqs, [:lftp, :lftq, :rgtq, :rgtp], unique: true
  end
end

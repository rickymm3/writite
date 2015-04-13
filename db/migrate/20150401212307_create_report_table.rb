class CreateReportTable < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :topic_id
      t.integer :reply_id
      t.integer :number
      t.timestamps
    end
  end
end

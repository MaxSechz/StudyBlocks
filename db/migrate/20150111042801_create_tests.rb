class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :deck_id, null: false
      t.timestamps
    end
  end
end

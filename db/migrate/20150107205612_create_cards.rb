class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :front, null: false
      t.text :back, null: false
      t.string :format
      t.integer :deck_id
      t.timestamps
    end
  end
end

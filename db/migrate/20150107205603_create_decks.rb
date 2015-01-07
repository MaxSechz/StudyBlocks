class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :title, null: false
      t.string :description
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end

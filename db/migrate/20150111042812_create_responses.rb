class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :response_text, null: false
      t.integer :test_id, null: false
      t.integer :card_id, null: false
      t.timestamps
    end
  end
end

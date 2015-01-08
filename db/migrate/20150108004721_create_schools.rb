class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :country, null: false
      t.string :state, null: false
      t.string :city, null: false
      t.timestamps
    end
  end
end

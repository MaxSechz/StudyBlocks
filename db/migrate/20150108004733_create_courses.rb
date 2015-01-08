class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.string :course_code, null: false
      t.string :instructor, null: false
      t.integer :school_id
      t.timestamps
    end
  end
end

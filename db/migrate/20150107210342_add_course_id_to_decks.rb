class AddCourseIdToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :course_id, :integer
  end
end

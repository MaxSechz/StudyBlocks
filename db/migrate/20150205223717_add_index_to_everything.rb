class AddIndexToEverything < ActiveRecord::Migration
  def change
    add_index(:cards, :deck_id)
    add_index(:courses, :school_id)
    add_index(:decks, :user_id)
    add_index(:registrations, [:course_id, :user_id], unique: true)
    add_index(:responses, [:test_id, :card_id], unique: true)
    add_index(:sessions, :user_id)
    add_index(:tests, [:user_id, :deck_id])
    add_index(:users, :school_id)
  end
end

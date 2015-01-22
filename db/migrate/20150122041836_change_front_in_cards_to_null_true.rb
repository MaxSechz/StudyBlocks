class ChangeFrontInCardsToNullTrue < ActiveRecord::Migration
  def change
    change_column_null(:cards, :front, true)
  end
end

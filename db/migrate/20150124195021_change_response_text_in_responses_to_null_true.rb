class ChangeResponseTextInResponsesToNullTrue < ActiveRecord::Migration
  def change
    change_column_null(:responses, :response_text, true)
  end
end

class AddOptionToEvent < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :option, foreign_key: true
  end
end

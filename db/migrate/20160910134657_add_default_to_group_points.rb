class AddDefaultToGroupPoints < ActiveRecord::Migration[5.0]
  def change
	change_column_default :groups, :points, 0
  end
end

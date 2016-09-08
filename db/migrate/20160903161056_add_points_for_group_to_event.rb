class AddPointsForGroupToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :group_points, :integer
  end
end

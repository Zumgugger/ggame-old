class AddPointsForTargetGroupToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :target_group_points, :integer
  end
end

class AddPointsForTargetToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :target_points, :integer
  end
end

class AddSortOrderToTargets < ActiveRecord::Migration[5.0]
  def change
    add_column :targets, :sort_order, :integer
  end
end

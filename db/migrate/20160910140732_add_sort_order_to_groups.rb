class AddSortOrderToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :sort_order, :integer
  end
end

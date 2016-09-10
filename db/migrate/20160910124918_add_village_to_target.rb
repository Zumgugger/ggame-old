class AddVillageToTarget < ActiveRecord::Migration[5.0]
  def change
    add_column :targets, :village, :string
  end
end

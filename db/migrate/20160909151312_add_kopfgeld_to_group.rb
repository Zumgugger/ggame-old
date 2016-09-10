class AddKopfgeldToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :kopfgeld, :integer, default: 0
  end
end

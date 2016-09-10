class ChangeDataTypeOfNatelNumberInGroupModel < ActiveRecord::Migration[5.0]
  def change
	change_column :groups, :natel1, :string
change_column :groups, :natel2, :string
change_column :groups, :natel3, :string
change_column :groups, :natel4, :string
  end
end

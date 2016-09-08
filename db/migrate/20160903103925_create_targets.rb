class CreateTargets < ActiveRecord::Migration[5.0]
  def change
    create_table :targets do |t|
      t.string :name
      t.string :description
      t.integer :points
      t.integer :mines, :default => 0
      t.integer :count, :default => 0
      t.datetime :last_action

      t.timestamps
    end
  end
end

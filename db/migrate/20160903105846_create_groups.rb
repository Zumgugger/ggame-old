class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :points
      t.string :member1
      t.string :member2
      t.string :member3
      t.string :member4
      t.integer :natel1
      t.integer :natel2
      t.integer :natel3
      t.integer :natel4
      t.boolean :false_information

      t.timestamps
    end
  end
end

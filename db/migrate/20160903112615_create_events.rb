class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.datetime :time
      t.references :group, foreign_key: true
      t.boolean :noticed
      t.integer :points_set
      t.references :target, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end

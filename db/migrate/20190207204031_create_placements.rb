class CreatePlacements < ActiveRecord::Migration[5.2]
  def change
    create_table :placements do |t|
      t.string :name
      t.date :start
      t.date :end
      t.integer :cpm

      t.timestamps
    end
  end
end

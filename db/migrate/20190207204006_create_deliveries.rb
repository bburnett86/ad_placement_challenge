class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.date :date
      t.integer :impressions
      
      t.timestamps
    end
  end
end

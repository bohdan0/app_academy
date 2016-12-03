class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :plate_id, null: false
      t.string :brand
      t.string :color
      t.string :owner_name
      t.timestamps
    end
  end
end

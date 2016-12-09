class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :color
      t.integer :size

      t.timestamps
    end
  end
end

class AddCarForPerson < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :car_plates, :string
  end
end

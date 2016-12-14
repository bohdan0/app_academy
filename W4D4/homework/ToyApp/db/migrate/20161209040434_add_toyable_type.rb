class AddToyableType < ActiveRecord::Migration
  def change
    add_column :toys, :toyable_type, :string
  end
end

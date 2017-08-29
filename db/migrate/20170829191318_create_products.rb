class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :item_type
      t.string :brand
      t.string :size
      t.string :price
      t.string :condition

      t.timestamps
    end
  end
end

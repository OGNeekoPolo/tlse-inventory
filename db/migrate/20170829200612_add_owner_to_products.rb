class AddOwnerToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :owner, foreign_key: true
  end
end

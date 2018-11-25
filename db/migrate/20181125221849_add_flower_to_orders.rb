class AddFlowerToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :flower, foreign_key: true
    remove_column :orders, :flower_name
    remove_column :orders, :description
    add_column :orders, :quantity, :integer
  end
end

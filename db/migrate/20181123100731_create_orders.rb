class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :flower_name
      t.string :description
      t.datetime :delivery_time
      t.string :client_name
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end

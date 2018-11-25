class OrderSerializer < ActiveModel::Serializer
  attributes :id, :flower_name, :flower_price, :quantity, :total_price, :delivery_time, :client_name, :address, :phone
end  
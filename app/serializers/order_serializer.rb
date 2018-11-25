class OrderSerializer < ActiveModel::Serializer
  attributes :id, :flower_name, :description, :delivery_time, :client_name, :address, :phone
end  
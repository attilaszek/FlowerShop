module API  
  module V1
    class Orders < Grape::API
      include API::V1::Defaults

      resource :orders do
        
        desc "Return all orders"
        get "", root: :orders do
          Order.all
        end

        desc "Create order"
        params do
          requires :flower_name, type: String
          optional :description, type: String
          requires :delivery_time, type: DateTime
          requires :client_name, type: String
          requires :address, type: String
          requires :phone, type: String
        end
        post "new", root: :orders do
          Order.create!(params)
        end

        desc "Edit order"
        params do
          requires :flower_name, type: String
          optional :description, type: String
          requires :delivery_time, type: DateTime
          requires :client_name, type: String
          requires :address, type: String
          requires :phone, type: String
        end
        patch "edit", root: :orders do
          Order.find(params[:id]).update!(params)
        end

      end
    end
  end
end

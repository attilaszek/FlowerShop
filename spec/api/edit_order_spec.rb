require 'rails_helper'

RSpec.describe API::V1::Orders do
  describe "edit" do
    before do
      @order = Order.create({
        flower_name: "Rose",
        description: nil,
        delivery_time: Time.new + 1.hours,
        client_name: "John Smith",
        address: "New York, 13th street, 47",
        phone: "2125644253"  
      })
    end

    let(:valid_params) do
      {
        id: @order.id,
        flower_name: "Begonia",
        description: "No description",
        delivery_time: Time.new + 2.hours,
        client_name: "Eva Adams",
        address: "New York, 11th street, 5",
        phone: "1239876540"   
      }
    end

    it "updates order" do
      patch "/api/v1/orders/edit", params: valid_params
      expect( response ).to have_http_status :ok
      @order = Order.find(@order.id)
      expect( @order["flower_name"] ).to eq("Begonia")
      expect( @order["description"] ).to eq("No description")
      expect( @order["delivery_time"] ).to be < Time.new + 2.hours
      expect( @order["client_name"] ).to eq("Eva Adams")
      expect( @order["address"] ).to eq("New York, 11th street, 5")
      expect( @order["phone"] ).to eq("1239876540")
    end

    it "fails without flower_name" do
      patch "/api/v1/orders/edit", params: valid_params.merge(flower_name: nil)
      expect( response ).to have_http_status(422)
      result = JSON.parse(response.body)
      expect( result["error"] ).to eq("Validation failed: Flower name can't be blank")
    end

    it "fails without delivery_time" do
      patch "/api/v1/orders/edit", params: valid_params.merge(delivery_time: nil)
      expect( response ).to have_http_status(422)
      result = JSON.parse(response.body)
      expect( result["error"] ).to eq("Validation failed: Delivery time can't be blank")
    end

    it "fails without client_name" do
      patch "/api/v1/orders/edit", params: valid_params.merge(client_name: nil)
      expect( response ).to have_http_status(422)
      result = JSON.parse(response.body)
      expect( result["error"] ).to eq("Validation failed: Client name can't be blank")
    end

    it "fails without address" do
      patch "/api/v1/orders/edit", params: valid_params.merge(address: nil)
      expect( response ).to have_http_status(422)
      result = JSON.parse(response.body)
      expect( result["error"] ).to eq("Validation failed: Address can't be blank")
    end

    it "fails without phone" do
      patch "/api/v1/orders/edit", params: valid_params.merge(phone: nil)
      expect( response ).to have_http_status(422)
      result = JSON.parse(response.body)
      expect( result["error"] ).to eq("Validation failed: Phone can't be blank, Phone is too short (minimum is 10 characters)")
    end

    it "fails with phone number too short" do
      patch "/api/v1/orders/edit", params: valid_params.merge(phone: "1234567")
      expect( response ).to have_http_status(422)
      result = JSON.parse(response.body)
      expect( result["error"] ).to eq("Validation failed: Phone is too short (minimum is 10 characters)")
    end
  end
end
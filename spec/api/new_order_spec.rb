require 'rails_helper'

RSpec.describe API::V1::Orders do
  describe "new" do
    rose = Flower.create!(name: "Rose", price: 3.50)
    let(:valid_params) do
      {
        flower_id: rose.id,
        quantity: 2,
        delivery_time: Time.new + 2.hours,
        client_name: "Eva Adams",
        address: "New York, 11th street, 5",
        phone: "1239876540"   
      }
    end

    it "creates new order" do
      expect { post "/api/v1/orders/new", params: valid_params }.to change(Order, :count).by(+1)
      expect( response ).to have_http_status :created
      order = JSON.parse(response.body)
      expect( order["flower_name"] ).to eq("Rose")
      expect( order["quantity"] ).to eq(2)
      expect( order["total_price"] ).to eq(7.00)
      expect( order["delivery_time"] ).to be < Time.new + 2.hours
      expect( order["client_name"] ).to eq("Eva Adams")
      expect( order["address"] ).to eq("New York, 11th street, 5")
      expect( order["phone"] ).to eq("1239876540")
    end

    it "fails without flower_id" do
      post "/api/v1/orders/new", params: valid_params.merge(flower_id: nil)
      expect( response ).to have_http_status(422)
      result = JSON.parse(response.body)
      expect( result["error"] ).to eq("Validation failed: Flower must exist, Flower can't be blank")
    end

    it "fails without quantity" do
      post "/api/v1/orders/new", params: valid_params.merge(quantity: nil)
      expect( response ).to have_http_status(422)
      result = JSON.parse(response.body)
      expect( result["error"] ).to eq("Validation failed: Quantity can't be blank, Quantity is not a number")
    end

    it "fails without delivery_time" do
      post "/api/v1/orders/new", params: valid_params.merge(delivery_time: nil)
      expect( response ).to have_http_status(422)
      result = JSON.parse(response.body)
      expect( result["error"] ).to eq("Validation failed: Delivery time can't be blank")
    end

    it "fails without client_name" do
      post "/api/v1/orders/new", params: valid_params.merge(client_name: nil)
      expect( response ).to have_http_status(422)
      result = JSON.parse(response.body)
      expect( result["error"] ).to eq("Validation failed: Client name can't be blank")
    end

    it "fails without address" do
      post "/api/v1/orders/new", params: valid_params.merge(address: nil)
      expect( response ).to have_http_status(422)
      result = JSON.parse(response.body)
      expect( result["error"] ).to eq("Validation failed: Address can't be blank")
    end

    it "fails without phone" do
      post "/api/v1/orders/new", params: valid_params.merge(phone: nil)
      expect( response ).to have_http_status(422)
      result = JSON.parse(response.body)
      expect( result["error"] ).to eq("Validation failed: Phone can't be blank, Phone is too short (minimum is 10 characters)")
    end

    it "fails with phone number too short" do
      post "/api/v1/orders/new", params: valid_params.merge(phone: "1234567")
      expect( response ).to have_http_status(422)
      result = JSON.parse(response.body)
      expect( result["error"] ).to eq("Validation failed: Phone is too short (minimum is 10 characters)")
    end
  end
end
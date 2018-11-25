require 'rails_helper'

RSpec.describe Order, type: :model do

  params = {
    flower: Flower.create!(name: "Rose", price: 3.50),
    quantity: 3,
    delivery_time: Time.new + 1.hours,
    client_name: "John Smith",
    address: "New York, 13th street, 47",
    phone: "2125644253"
  }

  it "is valid with valid attributes" do
    expect(Order.new(params)).to be_valid
  end

  it "is not valid without flower" do
    expect(Order.new(params.merge(flower: nil))).to be_invalid
  end

  it "is not valid without quantity" do
    expect(Order.new(params.merge(quantity: nil))).to be_invalid
  end

  it "is not valid with quantity less than 1" do
    expect(Order.new(params.merge(quantity: 0))).to be_invalid
  end

  it "is not valid without delivery_time" do
    expect(Order.new(params.merge(delivery_time: nil))).to be_invalid
  end
  
  it "is not valid with delivery_time before current time" do
    expect(Order.new(params.merge(delivery_time: Time.now - 1.hours))).to be_invalid
  end
  
  it "is not valid without client_name" do
    expect(Order.new(params.merge(client_name: nil))).to be_invalid
  end
  
  it "is not valid without address" do
    expect(Order.new(params.merge(address: nil))).to be_invalid
  end
  
  it "is not valid without phone" do
    expect(Order.new(params.merge(phone: nil))).to be_invalid
  end

  it "is not valid with invalid phone number (less than 10 characters)" do
    expect(Order.new(params.merge(phone: "123456789"))).to be_invalid
  end

  it "is not valid with invalid status number" do
    order = Order.new(params)
    order.status = 2
    expect(order).to be_invalid
  end

  it "calculates total price" do
    order = Order.new(params)
    expect(order.total_price).to eq(10.50)
  end

end

require 'rails_helper'

RSpec.describe Flower, type: :model do
  params = {
    name: "Rose",
    description: "The rose is a type of flowering shrub. Its name comes from the Latin word Rosa.",
    price: 3.50
  }

  it "is valid with valid attributes" do
    expect(Flower.new(params)).to be_valid
  end

  it "is not valid without name" do
    expect(Flower.new(params.merge(name: nil))).to be_invalid
  end

  it "is not valid without price" do
    expect(Flower.new(params.merge(price: nil))).to be_invalid
  end

  it "is not valid with price less than or equal with 0" do
    expect(Flower.new(params.merge(price: -1.20))).to be_invalid
  end
end

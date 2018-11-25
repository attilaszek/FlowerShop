rose = Flower.create({
  name: "Rose",
  description: "The rose is a type of flowering shrub. Its name comes from the Latin word Rosa.",
  price: 3.50
})

begonia = Flower.create({
  name: "Begonia",
  price: 2.30
})

Order.create({
  flower: rose,
  quantity: 1,
  delivery_time: Time.new + 1.hours,
  client_name: "John Smith",
  address: "New York, 13th street, 47",
  phone: "2125644253"  
})

Order.create({
  flower: begonia,
  quantity: 2,
  delivery_time: Time.new + 2.hours,
  client_name: "Eva Adams",
  address: "New York, 11th street, 5",
  phone: "1239876540"  
})

Order.create({
  flower: rose,
  quantity: 5,
  delivery_time: Time.new + 5.days,
  client_name: "Jessica Roberts",
  address: "New York, 5th avenue, 123",
  phone: "2233123456"  
})


Order.create({
  flower_name: "Rose",
  description: nil,
  delivery_time: Time.new + 1.hours,
  client_name: "John Smith",
  address: "New York, 13th street, 47",
  phone: "2125644253"  
})

Order.create({
  flower_name: "Begonia",
  description: nil,
  delivery_time: Time.new + 2.hours,
  client_name: "Eva Adams",
  address: "New York, 11th street, 5",
  phone: "1239876540"  
})

Order.create({
  flower_name: "Summer flowers",
  description: nil,
  delivery_time: Time.new + 5.days,
  client_name: "Jessica Roberts",
  address: "New York, 5th avenue, 123",
  phone: "2233123456"  
})


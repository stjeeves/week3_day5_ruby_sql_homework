require_relative("models/customer")
require_relative("models/film")
require('pry')

customer1 = Customer.new({ 'name' => 'Stephen', 'funds' => 20})
customer2 = Customer.new({ 'name' => 'Pamela', 'funds' => 40})
customer3 = Customer.new({ 'name' => 'Sebastian', 'funds' => 50})
customer4 = Customer.new({ 'name' => 'Rosa', 'funds' => 25})
customer5 = Customer.new({ 'name' => 'Demi', 'funds' => 10})

film1 = Film.new({ 'title' => 'Parasite', 'price' => 10})
film2 = Film.new({ 'title' => '1917', 'price' => 10})
film3 = Film.new({ 'title' => 'Little Women', 'price' => 10})
film4 = Film.new({ 'title' => 'Toy Story', 'price' => 5})

customer1.save
customer2.save
customer3.save
customer4.save
customer5.save

film1.save
film2.save
film3.save
film4.save

binding.pry

nil

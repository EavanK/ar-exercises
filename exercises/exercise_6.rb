require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
class Store
  has_many :employees
end

class Employee
  belongs_to :store
end

@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store2.employees.create(first_name: "Eavan", last_name: "Kim", hourly_rate: 100)

@store5 = Store.find_by(id: 5)
@store5.employees.create(first_name: "Hyunsu", last_name: "Kim", hourly_rate: 80)
@store6 = Store.find_by(id: 6)
@store5.employees.create(first_name: "Ted", last_name: "Mosby", hourly_rate: 50)
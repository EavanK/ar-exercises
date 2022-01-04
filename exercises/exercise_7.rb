require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
class Employee < ActiveRecord::Base
  validates :first_name, :last_name, :store, presence: true
  validates :hourly_rate, numericality: { greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
end

class Store < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validates :annual_revenue, numericality: { greater_than_or_equal_to: 0 }
  validate :one_of_apparel_has_to_be_true
  
  def one_of_apparel_has_to_be_true
    if !mens_apparel && !womens_apparel
      errors.add(:mens_apparel, "one of apparel has to be true")
      errors.add(:womens_apparel, "one of apparel has to be true")
    end
  end
end

puts "please type in your store name"
print "> "
store_name = gets.chomp
@store = Store.create(name: store_name)

if !@store.valid?
  @store.errors.messages.each {|key, message| puts "Error: #{key} --> #{message.first}"}
end
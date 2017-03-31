require 'pry'
class Drink < ActiveRecord::Base
  extend Adapters::AbsolutDrinks

  has_many :drink_ingredients
  has_many :ingredients, through: :drink_ingredients

  def list_ingredients_and_instructions # lists ingredients and instructions in a numbered list
    puts "\n #{self.name} Recipe:\n"
    self.drink_ingredients.each_with_index do |drink_ingredient, index|
      if drink_ingredient.portion == ""
  		    puts "#{index+1}. #{drink_ingredient.ingredient.name}"
      else
        puts "#{index+1}. #{drink_ingredient.portion} #{drink_ingredient.ingredient.name}"
      end
  	end
    puts "\nInstructions: #{self.instructions}\n\n"
  end
end

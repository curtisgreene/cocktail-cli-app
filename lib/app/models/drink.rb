require 'pry'
class Drink < ActiveRecord::Base
  extend Adapters::AbsolutDrinks

  has_many :drink_ingredients
  has_many :ingredients, through: :drink_ingredients

  def list_ingredients # lists ingredients in a numbered list
    self.drink_ingredients.each_with_index do |drink_ingredient, index|
      if drink_ingredient.portion == ""
  		    puts "#{index+1}. #{drink_ingredient.ingredient.name}"
      else
        puts "#{index+1}. #{drink_ingredient.portion} #{drink_ingredient.ingredient.name}"
      end
  	end
  end

  def give_instructions # prints the instructions
    puts self.instructions
  end

  #
  # def self.does_exist?(user_input) #
  # 	self.all.collect{|drink| drink.name}.include?(user_input)
  # end

end

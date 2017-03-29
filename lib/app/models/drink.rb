require 'pry'
class Drink < ActiveRecord::Base
  extend Adapters::AbsolutDrinks

  has_many :drink_ingredients
  has_many :ingredients, through: :drink_ingredients

  def list_ingredients # lists ingredients in a numbered list
    self.ingredients.each_with_index do |ingredient, index|
  		puts "#{index+1}. #{ingredient.name}"
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

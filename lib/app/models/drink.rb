require 'pry'
class Drink < ActiveRecord::Base
  extend Adapters::AbsolutDrinks

  has_many :drink_ingredients
  has_many :ingredients, through: :drink_ingredients

  # def self.list_ingredients_by_drink(get_user_input)
  #
  # 	# outputs to the console a list of ingredients per the drink given by the user || this works
  # 	idx = 1
  # 	self.where(["name = ?", get_user_input])[0].ingredients.each do |ingredient|
  # 		puts "#{idx}. #{ingredient.name}"
  # 		idx += 1
  # 	end
  # end

  # def self.find_drink(get_user_input)
  #   self.all.find_by_name(get_user_input)
  # end

  def list_ingredients
    self.ingredients.each_with_index do |ingredient, index|
  		puts "#{index+1}. #{ingredient.name}"
  	end
  end


  def self.does_exist?(user_input)
  	# returns an array of just drink names
  	self.all.collect{|drink| drink.name}.include?(user_input)
  end

end

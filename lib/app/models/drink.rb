class Drink < ActiveRecord::Base

  has_many :drink_ingredients
  has_many :ingredients, through: :drink_ingredients

  def self.list_ingredients_by_drink(user_input)

  	# outputs to the console a list of ingredients per the drink given by the user || this works
  	idx = 1
  	self.where(["name = ?", user_input])[0].ingredients.each do |ingredient| 
  		puts "#{idx}. #{ingredient.name}"
  		idx += 1
  	end
  end

  def self.get_all_drink_names
  	# returns an array of just drink names
  	self.all.collect{|drink| drink.name}
  end

end

class Ingredient < ActiveRecord::Base

  has_many :drink_ingredients
  has_many :drinks, through: :drink_ingredients

  def self.list_drinks_with_ingredient(ingredient)
  	# DrinkIngredient.all.where(["drink_id = ?", Ingredient.all.find_by(["name = ?", ingredient]).id)	
  end

  def drinks_ingredients(drink)
  	# returns an array ingredients for the drink passed into it || this works
  	Drink.where(["name = ?", drink])[0].ingredients.map {|ingredient| ingredient.name}
  end

  def self.get_all_ingredient_names
  	# returns an array of just the ingredient names || this works
  	Ingredient.all.collect {|ingredient| ingredient.name}
  end
end

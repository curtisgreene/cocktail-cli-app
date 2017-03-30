require_relative '../config/environment.rb'
require "pry"

welcome_message

until welcome_user_response == "q"
	drink_message
	user_input = get_user_input
	user_drink = Drink.find_by_name(user_input)
		if user_drink
			user_drink.list_ingredients
			user_drink.give_instructions
		elsif
				drink_data = Drink.fetch_drink_data(user_input) #returns JSON hash of one drink
				args = {
					name: drink_data["name"],
					instructions: drink_data["descriptionPlain"],
					glass_type: drink_data["servedIn"]["text"]
				}
				ingredients = drink_data["ingredients"] # array of ingredients
				drink = Drink.create(args)
				ingredients.each do |ingredient|
					ingredient_instance = Ingredient.find_or_create_by(name: ingredient["text"][/\[.*\]/][1..-2])
					ingredient_portion = ingredient["text"].gsub(/\[.*\]/, "").strip
					drink.ingredients << ingredient_instance

					new_drink_ingredient_row = DrinkIngredient.find_by(drink_id: drink.id, ingredient_id: ingredient_instance.id)
					new_drink_ingredient_row.portion = ingredient_portion.downcase
					new_drink_ingredient_row.save


				end# the hash of one drink requested based on URL above
				drink.list_ingredients
				drink.give_instructions
		else
			puts "Not a valid entry. Please try again."
		end
		welcome_message
end

no_such_drink

# api_request.create_drink_and_ingredient(user_input)

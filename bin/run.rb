require_relative '../config/environment.rb'
require "pry"
	extend Adapters::AbsolutDrinks

fancy_art
welcome_message
drink_or_ingredient
user_input = get_user_input

until user_input == "Q"
	if user_input == "D"
		drink_instructions
		drink_choice = get_user_input
		user_drink = Drink.find_by_name(drink_choice)
			if user_drink
				user_drink.list_ingredients
			elsif Drink.fetch_drink_data(drink_choice)
					drink_api_request(drink_choice)
			else
					no_such_item(drink_choice)
			end
	elsif  user_input == "I"
		ingredient_instructions
		ingredient_choice = get_user_input
		#user_ingredient = Ingredient.find_by_name(user_input)
			if !Drink.fetch_ingredient_data(ingredient_choice).empty?
					ingredient_api_request(ingredient_choice)
			else
					no_such_item(ingredient_choice)
			end
	end
	drink_or_ingredient
	user_input = get_user_input
end



# api_request.create_drink_and_ingredient(user_input)

require_relative '../config/environment.rb'
require "pry"
	extend Adapters::AbsolutDrinks

fancy_art
welcome_message
drink_or_ingredient
user_input = get_user_input

until user_input == "Q" # looping until the user wants to quit
	if user_input == "D" # user wants a drink
		drink_instructions
		drink_choice = get_user_input
		user_drink = Drink.find_by_name(drink_choice)
			if user_drink # checks the database
				user_drink.list_ingredients_and_instructions
			elsif Drink.fetch_drink_data(drink_choice) # if the drink isn't in the database, hit the API
					drink_api_request(drink_choice)
			else # drink is in neither the database or the API
					no_such_item(drink_choice)
			end
	elsif  user_input == "I" # user wants to search by ingredient
		ingredient_instructions
		ingredient_choice = get_user_input
			if ingredient_choice == "Vodka" # helps not break when searching for Vodka
        ingredient_choice = "Absolut Vodka"
			end
		#user_ingredient = Ingredient.find_by_name(user_input)
			if !Drink.fetch_ingredient_data(ingredient_choice).empty? # hit the api
					ingredient_api_request(ingredient_choice)
			else
					no_such_item(ingredient_choice) # no such ingredient in the API
			end
	end
	drink_or_ingredient #starts the loop again until user_input = Q
	user_input = get_user_input
end

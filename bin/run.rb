require_relative '../config/environment.rb'
require "pry"
	extend Adapters::AbsolutDrinks

fancy_shit
welcome_message
instructions
user_input = get_user_input

until user_input == "Q"
	user_drink = Drink.find_by_name(user_input)
		if user_drink
			user_drink.list_ingredients
		elsif Drink.fetch_drink_data(user_input)
				api_request(user_input)
		else
				no_such_drink(user_input)
		end
		instructions
		user_input = get_user_input
end



# api_request.create_drink_and_ingredient(user_input)

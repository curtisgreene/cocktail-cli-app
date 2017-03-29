require_relative '../config/environment.rb'


welcome_message
user_input = get_user_input
Drink.list_ingredients_by_drink(user_input)

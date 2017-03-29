require_relative 'config/environment'

	def welcome_message
		
	end

	def check_user_input_validity(user_input)
		# validates the user input is contained in our database || this works
		Drink.get_all_drink_names.include?(user_input) || Ingredient.get_all_ingredient_names.include?(user_input) ? true : false	
	end

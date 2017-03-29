require_relative '../config/environment.rb'


welcome_message
user_input = get_user_input
user_drink = Drink.find_by_name(user_input)
if user_drink
	user_drink.list_ingredients
else
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
			drink.ingredients << ingredient_instance
		end# the hash of one drink requested based on URL above
		drink.list_ingredients
end


# api_request.create_drink_and_ingredient(user_input)

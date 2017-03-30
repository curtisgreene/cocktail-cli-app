module Adapters::AbsolutDrinks

  BASE_URL = "https://addb.absolutdrinks.com/drinks/"
  API_KEY = "?apikey=6d5cf1235dc142648d2e2cf1e45a09c3"

  def fetch_drink_data(user_input) # manipulates user input into necessary format
    query = user_input.downcase.gsub(" ", "-")
    response = RestClient.get("#{BASE_URL}#{query}#{API_KEY}")
    data = JSON.parse(response)
    drink_data = data["result"][0]
  end

  def api_request(user_input)
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
  end

end

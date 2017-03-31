module Adapters::AbsolutDrinks
 ######DRINKS##########
  BASE_URL = "https://addb.absolutdrinks.com/"
  API_KEY = "/?apikey=6d5cf1235dc142648d2e2cf1e45a09c3"

  def fetch_drink_data(user_input) # manipulates user input into necessary format
    query = user_input.downcase.gsub(" ", "-")
    response = RestClient.get("#{BASE_URL}drinks/#{query}#{API_KEY}")
    data = JSON.parse(response)
    drink_data = data["result"][0]
  end

  def drink_api_request(user_input)
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


  ######INGREDIENTS#######

  #We ask user wheter they want to find a drink by name or ingredients
  #If by drink, we run above code
  #If by ingredients, we run methods below

  #User can enter several ingredients separated by coma
  #We



  def fetch_ingredient_data(user_input) # manipulates user input into necessary format
    query = user_input.downcase.gsub(" ", "-")
    response = RestClient.get("#{BASE_URL}drinks/with/#{query}#{API_KEY}")   #serching by ingredient
    data = JSON.parse(response)
    drink_data = data["result"][0..2]
  end

  def ingredient_api_request(user_input)
    drink_data = Drink.fetch_ingredient_data(user_input) #returns JSON hash of one drink

    drink_data.each do |drink_hash|

      args = {
        name: drink_hash["name"],
        instructions: drink_hash["descriptionPlain"],
        glass_type: drink_hash["servedIn"]["text"]
      }

      ingredients = drink_hash["ingredients"] # array of ingredients
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
      puts "=" * 60
    end
  end
end

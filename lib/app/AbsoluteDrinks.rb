module Adapters::AbsolutDrinks
 ######DRINKS##########
  BASE_URL = "https://addb.absolutdrinks.com/"
  API_KEY = "/?apikey=6d5cf1235dc142648d2e2cf1e45a09c3"

  def fetch_drink_data(user_input) # manipulates user input into necessary format and pings the API, returns a usable hash
    query = user_input.downcase.gsub(" ", "-")
    response = RestClient.get("#{BASE_URL}drinks/#{query}#{API_KEY}")
    data = JSON.parse(response)
    drink_data = data["result"][0]
  end

  def drink_api_request(user_input) #
    drink_data = Drink.fetch_drink_data(user_input) #returns JSON hash of one drink
    args = {                          #mass assign arguments to create new drink
      name: drink_data["name"],
      instructions: drink_data["descriptionPlain"],
      glass_type: drink_data["servedIn"]["text"]
    }
    ingredients = drink_data["ingredients"] # array of ingredients
    drink = Drink.create(args) # creates new drink based on arguments
    ingredients.each do |ingredient| # iterates over list of ingredients
      ingredient_instance = Ingredient.find_or_create_by(name: ingredient["text"][/\[.*\]/][1..-2]) # creates ingredient with name from text inside brackets
      ingredient_portion = ingredient["text"].gsub(/\[.*\]/, "").strip # grabs the text not in brackets to preserve portions
      drink.ingredients << ingredient_instance # associates ingredient with new drink

      new_drink_ingredient_row = DrinkIngredient.find_by(drink_id: drink.id, ingredient_id: ingredient_instance.id) # finds the specific DrinkIngredient row
      new_drink_ingredient_row.portion = ingredient_portion.downcase # assigns the portion to the found row
      new_drink_ingredient_row.save
      end# the hash of one drink requested based on URL above
    drink.list_ingredients_and_instructions
  end


  ######INGREDIENTS#######


  def fetch_ingredient_data(user_input) # manipulates user input into necessary format and returns a usable hash
    query = user_input.downcase.gsub(" ", "-")
    response = RestClient.get("#{BASE_URL}drinks/with/#{query}#{API_KEY}")   #serching by ingredient
    data = JSON.parse(response)
    drink_data = data["result"].shuffle[0..2]
  end

  def ingredient_api_request(user_input)
    drink_data = Drink.fetch_ingredient_data(user_input) #returns JSON hash of one drink

    drink_data.each do |drink_hash|

      args = { # mass assigning arguments
        name: drink_hash["name"],
        instructions: drink_hash["descriptionPlain"],
        glass_type: drink_hash["servedIn"]["text"]
      }

      ingredients = drink_hash["ingredients"] # array of ingredients
      drink = Drink.create(args) # creates drink with arguments

      ingredients.each do |ingredient| # iterates over list of ingredients for the drink
        ingredient_instance = Ingredient.find_or_create_by(name: ingredient["text"][/\[.*\]/][1..-2]) #grabs ingredient names from inside brackets
        ingredient_portion = ingredient["text"].gsub(/\[.*\]/, "").strip # grabs portion from text not inside the brackets
        drink.ingredients << ingredient_instance # creating the association

        new_drink_ingredient_row = DrinkIngredient.find_by(drink_id: drink.id, ingredient_id: ingredient_instance.id) # finding the right row in the join table
        new_drink_ingredient_row.portion = ingredient_portion.downcase # assigning portion
        new_drink_ingredient_row.save
      end# the hash of one drink requested based on URL above
      drink.list_ingredients_and_instructions
      puts "=" * 60
    end
  end
end

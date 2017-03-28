require 'rest-client'
require 'json'
require 'pry'

all_drinks = RestClient.get("http://addb.absolutdrinks.com/drinks/?apikey=6d5cf1235dc142648d2e2cf1e45a09c3&start=1&pageSize=3637")
drink_hash = JSON.parse(all_drinks)

drink_hash["result"].each do |drink|
    args = {

        name: drink["name"],
        instructions: drink["descriptionPlain"],
        glass_type: drink["servedIn"]["text"]

    }
    var = Drink.create(args)
    drink["ingredients"].each do |ingredient|
      args_b = {
        name: ingredient["text"][/\[.*\]/][1..-2]
      }
      var_b = Ingredient.find_or_create_by(args_b)
      var.ingredients << var_b
    end
end


#
# all_ingredients = RestClient.get("http://addb.absolutdrinks.com/ingredients/?apikey=6d5cf1235dc142648d2e2cf1e45a09c3&start=1&pageSize=484")
# ingredient_hash = JSON.parse(all_ingredients)
#
# ingredient_hash["result"].each do |ingredient|
#   args_i = {
#
#     # id_string: ingredient["id"],
#     name: ingredient["name"]
#
#   }
#
#   Ingredient.create(args_i)
# end

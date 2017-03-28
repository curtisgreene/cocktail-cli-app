require 'rest-client'
require 'json'
require 'pry'

class Drink < ActiveRecord::Base


  all_drinks = RestClient.get("http://addb.absolutdrinks.com/drinks/?apikey=6d5cf1235dc142648d2e2cf1e45a09c3&start=1&pageSize=3637")
  drink_hash = JSON.parse(all_drinks)

  def self.fix_drink_hash(drink_hash)
    nice_hash = {}
    keys_we_want = ["name", "descriptionPlain", "id", "servedIn"]
    drink_hash["result"].each do |drink|
      binding.pry
      drink.each do |key, value|
        if keys_we_want.include?(key)
          nice_hash[key] = value
        end
      end
    end
    nice_hash
  end

end

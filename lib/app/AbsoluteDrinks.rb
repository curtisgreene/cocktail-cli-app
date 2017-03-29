module Adapters::AbsolutDrinks

  attr_reader :query

  BASE_URL = "https://addb.absolutdrinks.com/drinks/"
  API_KEY = "?apikey=6d5cf1235dc142648d2e2cf1e45a09c3"

  def fetch_drink_data(user_input)
    # manipulates user input into necessary format
    query =  user_input.downcase.gsub(" ", "-")
    response = RestClient.get("#{BASE_URL}#{query}#{API_KEY}")
    data = JSON.parse(response)
    drink_data = data["result"][0]
  end


  # def create_drink_and_ingredient(drink_data)
  #
  #
  #
  # end

end

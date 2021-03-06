require_relative '../../config/environment.rb'

def fancy_art # courtesy of Chris.com/ascii and http://patorjk.com/software/taag
  puts "
 .o88b.  .d88b.   .o88b. db   dD d888888b  .d8b.  d888888b db
d8P  Y8 .8P  Y8. d8P  Y8 88 ,8P' `~~88~~' d8' `8b   `88'   88
8P      88    88 8P      88,8P      88    88ooo88    88    88
8b      88    88 8b      88`8b      88    88~~~88    88    88
Y8b  d8 `8b  d8' Y8b  d8 88 `88.    88    88   88   .88.   88boo.
 `Y88P'  `Y88P'   `Y88P' YP   YD    YP    YP   YP Y888888P Y8888P

      d88888b d888888b d8b   db d8888b. d88888b d8888b.
      88'       `88'   888o  88 88  `8D 88'     88  `8D
      88ooo      88    88V8o 88 88   88 88ooooo 88oobY'
      88~~~      88    88 V8o88 88   88 88~~~~~ 88`8b
      88        .88.   88  V888 88  .8D 88.     88 `88.
      YP      Y888888P VP   V8P Y8888D' Y88888P 88   YD
      ___
      )_(                                            _
      | |                                           [_ ]
    .-'-'-.       _                               .-'. '-.
   /-::_..-|    _[_]_                            /:;/ _.-'|
   )_     _(   /_   _|      [-]                  |:._   .-|
   |;::    |   )_``'_(    .-'-'-.       (-)      |:._     |
   |;::    |   |;:   |    :-...-:     .-'-'-.    |:._     |
   |;::    |   |;:   |    |;:   |     |-...-|    |:._     |
   |;::-.._|   |;:.._|    |;:.._|     |;:.._|    |:._     |
   `-.._..-'   `-...-'    `-...-'     `-...-'    `-.____.-'\n\n"

end

def welcome_message
  puts "Hello! Welcome to The Cocktail Recipe Finder.\nI can show you recipes for your favorite cocktails\n\n"
end

def drink_or_ingredient
 puts "\n"
 puts "🍸  " * 26
 puts "\n"
 puts "Enter 'd' to search by Drink name, 'i' to search by Ingredient or 'q' to quit:"
end

def get_user_input
  query = gets.strip.split.map(&:capitalize).join(' ')
end

def drink_instructions
  puts "Enter the name of a cocktail:"
end

def ingredient_instructions
  puts "Enter the name of an ingredient:"
end

def no_such_item(user_input)
  puts "\nOops..We can't find #{user_input} in our database. \nPlease try another search."
end

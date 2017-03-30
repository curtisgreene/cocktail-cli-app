def fancy_shit
  puts "
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
   `-.._..-'   `-...-'    `-...-'     `-...-'    `-.____.-'"

end

def welcome_message
  puts "Hello! Welcome to The Cocktail Recipe Finder.\nI can show you recipes for your favorite cocktails"

end

def instructions
  puts "*" * 60
  puts "Enter the name of a cocktail or 'q' to quit:"
end

def get_user_input
  query = gets.strip.split.map(&:capitalize).join(' ')
end

def no_such_drink(user_input)
  puts "\nOops..We can't find #{user_input} in our database. \nPlease try another cocktail."
end

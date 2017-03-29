def welcome_message
  puts "Hello! Please enter a drink name to learn ingredients"
end

def get_user_input
  query = gets.strip
end

def no_such_drink
  puts "Sorry, please try a different drink!"
end

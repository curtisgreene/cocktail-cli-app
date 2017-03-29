def welcome_message
  puts "Hello! Please enter a drink name to learn ingredients"
end

def get_user_input
  query = gets.strip.split.map(&:capitalize).join(' ')
end

def no_such_drink
  puts "Maybe you've had enough."
end

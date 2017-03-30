def welcome_message
  puts "Hello! Please enter 'd' for drink ingredients and 'q' to quit:"
end

def welcome_user_response
	response = gets.strip.downcase
end

def drink_message
	puts "Please enter a drink to show it's ingredients:"
end

def get_user_input
  query = gets.strip.split.map(&:capitalize).join(' ')
end

def no_such_drink
  puts "Maybe you've had enough."
end

require 'rest-client'

puts "What do you want to search on google?"
search_params = gets.chomp

response = RestClient.get('https://www.google.com', {:params => {:q => search_params}})
p response.code
p response.body
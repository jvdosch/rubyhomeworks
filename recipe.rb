require 'httparty'

class Recipe
  include HTTParty

  base_uri 'www.recipepuppy.com'
  default_params output: 'json'
  format :json

  def self.for (keyword)

    response = get('/api/', :query => {:q => keyword, :onlyImages => 1})

    response['results']

  end

end

puts Recipe.for "chocolate"
puts
puts
puts Recipe.for "apple pie"
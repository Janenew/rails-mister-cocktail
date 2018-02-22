require 'json'
require 'open-uri'

# db/seeds.rb
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
puts "Add seed for ingredients"

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = open(url).read
ingredients = JSON.parse(response)

ingredients.first.last.each { |item| Ingredient.create!(name: item["strIngredient1"]) }
nbr_of_ingredients = Ingredient.all.size
p Ingredient.all
puts "End of ingredients seed"
puts " #{nbr_of_ingredients} ingredients registered in db"
puts "End of seed of ingredients"


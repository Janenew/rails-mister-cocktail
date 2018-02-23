require 'json'
require 'open-uri'

db/seeds.rb
Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")
Ingredient.destroy_all
puts "Add seed for ingredients"

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = open(url).read
ingredients = JSON.parse(response)

ingredients['drinks'].each { |item| Ingredient.create!(name: item["strIngredient1"]) }
nbr_of_ingredients = Ingredient.all.size
p Ingredient.all
puts "End of ingredients seed"
puts " #{nbr_of_ingredients} ingredients registered in db"
puts "End of seed of ingredients"



Cocktail.destroy_all
puts "Add seed for cocktails"

cocktails_params =
[
  { name: 'Kir',
    image_url: 'https://images.unsplash.com/photo-1506377247377-2a5b3b417ebb?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=efa71ae041cd94e911339f2e42a405a9&auto=format&fit=crop&w=800&q=60'
  },
  { name: 'Monaco',
    image_url: 'https://images.unsplash.com/photo-1487536988267-23b03fdfc3c3?ixlib=rb-0.3.5&s=0fd2fe72fcebb9daa67818d9a49186df&auto=format&fit=crop&w=334&q=80'
  },
  { name: 'Caipirinha',
    image_url: 'https://images.unsplash.com/photo-1497801030637-c91e0b3b0b8e?ixlib=rb-0.3.5&s=296193641123981b7cd57018fa77cebd&auto=format&fit=crop&w=750&q=80'
  },
  { name: 'Mojito',
    image_url: 'https://images.unsplash.com/photo-1510626176961-4b57d4fbad03?ixlib=rb-0.3.5&s=4e9face33a62237d5846e32db4fa114e&auto=format&fit=crop&w=334&q=80'
  },
  { name: 'Pina colada',
    image_url: 'https://images.unsplash.com/photo-1501118926561-2d75eefb2628?ixlib=rb-0.3.5&s=577aa46cd2b044c7401a1b1ac944e3d3&auto=format&fit=crop&w=334&q=80'
  },
  { name: 'Martini',
    image_url: 'https://images.unsplash.com/photo-1444728399417-08d2aa39e6f4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a75d09107dd70d0e844460c45024ca3c&auto=format&fit=crop&w=1050&q=80'
  }
]
Cocktail.create!(cocktails_params)
p Cocktail.all
puts "End of seed of cocktails"


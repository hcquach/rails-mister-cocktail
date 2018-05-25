# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

# ingredient1 = Ingredient.create(name: "lemon")
# ingredient2 = Ingredient.create(name: "ice")
# ingredient3 = Ingredient.create(name: "mint leaves")

# cocktail1 = Cocktail.create!(name: "lemon juice")

# dose1 = Dose.create!(description: "3 lemons and water", cocktail_id: cocktail1.id, ingredient_id: ingredient1.id)

Cocktail.destroy_all if Rails.env.development?
Dose.destroy_all if Rails.env.development?
Ingredient.destroy_all if Rails.env.development?

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredients = JSON.parse(ingredient_serialized)

ingredients['drinks'].each do |hash_ingredient|
  ingredient = hash_ingredient['strIngredient1']
  Ingredient.create!(name: ingredient.capitalize)
end

["SAZERAC", "MOJITO", "MOSCOW MULE", "MARGARITA", "DRY MARTINI", "WHISKEY SOUR", "MANHATTAN", "DAIQUIRI", "NEGRONI", "OLD FASHIONED"].each do |cocktail|
  Cocktail.create!(name: cocktail.capitalize)
end

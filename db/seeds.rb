# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Ingredient
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

require 'json'
require 'open-uri'


url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json_file = open(url).read
ingredients_json = JSON.parse(json_file)

list_objects = ingredients_json["drinks"]
array_drinks = []
list_objects.each do |obj|
 array_drinks << obj["strIngredient1"]
end

Ingredient.destroy_all

array_drinks.each do |ing|
  Ingredient.create(
  name: ing
  )
end



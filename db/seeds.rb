# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

puts 'Destroying existing rows on database.'

Cocktail.destroy_all
Ingredient.destroy_all

puts 'Getting ingredient names from the internet.'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_json = open(url).read
ingredients = JSON.parse(ingredients_json)

puts 'Adding ingredients to the database...'

ingredients.first[1].each do |ingredient_name|
  ingredient = Ingredient.new(name: ingredient_name)
  ingredient.save!
end

puts 'Finished!'

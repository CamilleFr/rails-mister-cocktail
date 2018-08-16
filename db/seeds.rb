# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
puts "Destroy"
Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json_url = open(url).read

drinks = JSON.parse(json_url)

drinks.each_value do |ingredients|
  ingredients.each do |ingredient|
    ingredient_name = ingredient["strIngredient1"]
    Ingredient.create!(name: ingredient_name)
  end
end

p Ingredient.all

cuba_libre = Cocktail.create!(name: "Cuba Libre")
tequila = Cocktail.create!(name: "Tequila Sunrise")
mojito = Cocktail.create!(name: "Mojito")
caipirihna = Cocktail.create!(name: "Caipirinha")

p Cocktail.all



Dose.create!(description: "10cl", ingredient_id: Ingredient.last.id, cocktail_id: cuba_libre.id)

p Dose.all

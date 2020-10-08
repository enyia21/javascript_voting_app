# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
# require 'rest'
# 10.times do 
#     firstName = Faker::Name.first_name
#     lastName = Faker::Name.unique.last_name
#     email = Faker::Internet.safe_email(name: lastName)
#     age = rand(10..50)
#     User.create(
#         first_name: firstName,
#         last_name: lastName,
#         email: email,
#         age: age
#     )
    
#     dbcName = Faker::JapaneseMedia::DragonBall.character
#     dbcCharacterRace = Faker::JapaneseMedia::DragonBall.race
#     dbcCharacterPlanet = Faker::JapaneseMedia::DragonBall.planet 
#     dbcCharacter = DragonBallCharacter.new(
#         name: dbcName,
#         race: dbcCharacterRace,
#         planet: dbcCharacterPlanet
#     )
#     while !(dbcCharacter.save)
#         dbcName = Faker::JapaneseMedia::DragonBall.character
#         # dbcCharacterRace = Faker::JapaneseMedia::DragonBall.race 
#         dbcCharacterPlanet = Faker::JapaneseMedia::DragonBall.planet 
#         dbcCharacter = DragonBallCharacter.new(
#             name: dbcName,
#             race: dbcCharacterRace,
#             planet: dbcCharacterPlanet
#         )
#     end
# end
# end

require 'rest-client'
40.times do
    userId = rand(1..700)
    superhero_character_url = "https://superheroapi.com/api/10215771175427274/#{userId}"
    superhero_character = RestClient.get superhero_character_url
    superhero_character_array = JSON.parse(superhero_character)
    binding.pry
    hero = User.new(
        name: superhero_character_array["name"],
        gender: superhero_character_array["appearance"]["gender"],
        power_level: superhero_character_array["powerstats"]["power"],
        alias: superhero_character_array["biography"]["full-name"],
        place_of_birth: superhero_character_array["biography"]["place-of-birth"],
        publisher: superhero_character_array["biography"]["publisher"],
        alignment: superhero_character_array["biography"]["alignment"],
        team_affiliation: superhero_character_array["connections"]["group-affiliation"],
        image: superhero_character_array["image"]["url"]   
    )
    hero.save
end

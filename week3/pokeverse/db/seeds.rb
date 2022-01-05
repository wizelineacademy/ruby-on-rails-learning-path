# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#***CREATE USER TYPES***
UserType.destroy_all
UserType.create(:user_type => 'normal')
UserType.create(:user_type => 'admin')

#***CREATE CHARACTER/ABILITY TYPES***
Type.destroy_all
Type.create(:color => "blue", :description => "Characters with these abilities exhibit finesse, agility and coordination. Such abilities often provide ways for characters to be faster or more flexible.")
Type.create(:color => "red", :description => "Characters with these abilities exhibit forcefulness, strength and fortitude. Such abilities often provide ways for characters to be mighty or more resilient.")
Type.create(:color => "gray", :description => "Characters with these abilities exhibit cunning, ingenuity and deception. Such abilities often provide ways for characters to trick or inhibit rivals.")
Type.create(:color => "yellow", :description => "Characters with these abilities exhibit leadership, charisma and willpower. Such abilities often provide ways to bolster allies or give them actions.")
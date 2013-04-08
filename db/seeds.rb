# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# README
# The following seeds the database with food items given the table-separated
# file found at public/foods.csv

File.open("public/foods.csv").each do |record|
	fields = record.split("\t")
	if fields.length >= 7
		tags = fields[6][0...-1]
		@food = Food.new(number: fields[0], name: fields[1], calorie: fields[2], serving_size: fields[3], company: fields[4], source: fields[5], tags: tags)
		@food.save
	end
end


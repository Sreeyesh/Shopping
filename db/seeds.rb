# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
include Faker

ram_arr = [2,4,6,8]

ext_arr = [32,64,128,256]

Product.destroy_all

5000.times do |idx|

	Product.create(
		name: "mobile_#{idx}",
		model:Faker::Device.model_name,
		brand: Faker::Device.manufacturer,
		year:Faker::Vehicle.year,
		ram: ram_arr[rand(0..3)],
		external:ext_arr[rand(0..3)]
	)

end

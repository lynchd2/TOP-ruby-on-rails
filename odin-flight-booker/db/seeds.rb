# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
airport_ids = ["JFK", "SFO", "TPA", "POR"]

10.times do |n|
  to_airport_id  = airport_ids[rand(0..3)]
  from_airport_id = airport_ids[rand(0..3)]
  duration = "#{rand(0..24)}:" + "#{rand(00..60)}:" + "#{rand(0..60)}" 
  Flight.create!(to_airport_id:  to_airport_id,
               from_airport_id: from_airport_id,
               duration:              duration)
end
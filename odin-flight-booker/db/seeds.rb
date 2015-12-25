# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
airports = {"JFK"=> "New York City", "SFO" => "San Francisco", "TPA" => "Tampa",
			"POR" => "Portland"}

all_airports = airports.map do |code, city|
	Airport.create(airport_code: code, city: city)
end

10.times do 

index_for_airports = airports.length - 1
to_airport_id = rand(0..index_for_airports)
from_airport_id = rand(0..index_for_airports)
until from_airport_id != to_airport_id
	from_airport_id = rand(0..index_for_airports)
end
  Flight.create!(to_airport_id: to_airport_id,
               from_airport_id: from_airport_id,
               duration: "#{rand(0..24)}:" + "#{rand(00..60)}:" + "#{rand(0..60)}",
               start_time: DateTime.now.advance(months: rand(0..1), days: rand(0..15), hours: rand(0..24)))

end
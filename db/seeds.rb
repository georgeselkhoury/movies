
actor_one = Actor.create(full_name: 'Actor One')
actor_two = Actor.create(full_name: 'Actor Two')
director = Director.create(full_name: 'Director')
distributor = Distributor.create(name: 'Distributor')
writer = Writer.create(full_name: 'Writer')
production_company = ProductionCompany.create(name: 'Production Company')

location_one = Location.create(address: 'San Francisco', latitude: 37.7749300, longitude: -122.4194200)
location_two = Location.create(address: 'Uber HQ', latitude: 37.788040, longitude: -122.402934)


movie = Movie.new(title: 'Movie', release_year: 2015, fun_facts: 'fun_facts')

movie.actors.push(actor_one)
movie.actors.push(actor_two)

movie.director = director
movie.distributor = distributor
movie.writer = writer
movie.production_company = production_company

movie.locations.push(location_one)
movie.locations.push(location_two)

movie.save
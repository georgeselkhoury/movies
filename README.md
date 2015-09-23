# Movies by Locations

Movies by Locations maintains a directory of movies and the diffrent locations where they have been filmed

## APIs

The APIs follows RESTful principles. All responses are served in JSON. No authentication is required.

The APIs supports  two endpoints:

* /movies
* /locations


### Movies

To find movies matching specific search criteria you must send a request to the /movies endpoint. Sending a request to /movies will return a list of movies

#### Getting a movie by id

To get a single movie document, simply add the ID of the movie to the URL.

e.g. http://movies-by-locations.herokuapp.com/movies/1440

#### Arguments

The following arguments can be used to scope the results to match the query criteria: title, actor.full_name, director.full_name, distributor.name, production_company.name and writer.name

* title 
* actor.full_name
* director.full_name
* distributor.name
* production_company.name
* writer.name

##### Examples:

All movies with title Godzilla:
http://movies-by-locations.herokuapp.com/movies?title=Godzilla 

All movies with actors named Robert:
http://movies-by-locations.herokuapp.com/movies?actor.full_name=Robert

All movies directed by Georges Lucas: 
http://movies-by-locations.herokuapp.com/movies?director.full_name=george%20lucas

All movies distributed by Columbia Pictures:
http://movies-by-locations.herokuapp.com/movies?distributor.name=columbia

All movies produced by Universal Pictures:
http://movies-by-locations.herokuapp.com/movies?production_company.name=Universal%20Pictures

All movies written by Sorkin:
http://movies-by-locations.herokuapp.com/movies?writer.name=sorkin



### Locations

To find locations where movies have been filmed, you must send a request to the /locations endpoint. Sending a request to /locations will return a list of locations.

#### Getting a location by id

To get a single location document, simply add the ID of the movie to the URL.

e.g. http://movies-by-locations.herokuapp.com/locations/2619

#### Arguments

The following arguments can be used to scope the results to match the geographical area:

* latitude 
* longitude

##### Examples:

All locations having movies filmed in San Francisco:
http://movies-by-locations.herokuapp.com/locations?latitude=37.7833&longitude=-122.4167

All locations having movies filmed in Seattle:
http://movies-by-locations.herokuapp.com/locations?latitude=47.6097&longitude=-122.3331


## Website Client

You can find a website application consuming the APIs on:
http://movies-by-locations.herokuapp.com/

Have fun using the website and try the following:

* Find all the movies that's been filmed at Alcatraz?
* Find where the Godzilla went in SF?

## Code Review Instructions

Backend:
* Locations and Movies controllers
* Models to get an understanding of the object relationships
* Rake tasks used to import the data 
 
 Website:
 * Code located in public folder
 * index.js contains all the website functionalities


## Unit Test

Models:
* should have the necessary required validators

Movies Controller:
* should get index
* should return all movies
* should return all movies that starts with Movie O
* should return all movies that starts with movie tw (case insensitive)
* should not return any movie
* should return all movies with actor Actor Two
* should return all movies with director Director Two
* should return all movies with distributor Distributor Two
* should return all movies with production company Production Company Two
* should return all movies with writer Writer Two
* should show movie

Location Controller:
* should get index
* should return all locations
* should return SF locations only
* should return Seattle locations only


## To Do

##### Paging

Add paging support for the APIs.

Instructions: 
* Add the [will_paginate](https://github.com/mislav/will_paginate) GEM
* Add paging object to the response with the following property: first, previous, next and last

Estimated duration: 3 hours

##### Website Client Framework

The website javascript code is not production ready. Either componentize the current implementation or replace it with templates and bindings enabled frameworks. (e.g. Angular) or component based frameworks (REACT)

##### Caching

Add caching with memcached on the APIs 

##### Data Import

Add more functionalities to the rake task movies:create_movies_database for data imports. Support multiple data sources, retries and multiple runs.



## Dependencies

Backend:
* [Rails](https://github.com/rails/rails)
* [Geocoder](https://github.com/alexreisner/geocoder)

Website Assets:
* Jquery
* Bootstrap
* Google Maps SDK

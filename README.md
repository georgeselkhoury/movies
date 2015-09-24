# Movies by Locations

Movies by Locations maintains a directory of movies and the different locations where they have been filmed

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

All movies with title Godzilla:<br>
http://movies-by-locations.herokuapp.com/movies?title=Godzilla 

All movies with actors named Robert:<br>
http://movies-by-locations.herokuapp.com/movies?actor.full_name=Robert

All movies directed by Georges Lucas:<br>
http://movies-by-locations.herokuapp.com/movies?director.full_name=george%20lucas

All movies distributed by Columbia Pictures:<br>
http://movies-by-locations.herokuapp.com/movies?distributor.name=columbia

All movies produced by Universal Pictures:<br>
http://movies-by-locations.herokuapp.com/movies?production_company.name=Universal%20Pictures

All movies written by Sorkin:<br>
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

All locations having movies filmed in San Francisco:<br>
http://movies-by-locations.herokuapp.com/locations?latitude=37.7833&longitude=-122.4167

All locations having movies filmed in Seattle:<br>
http://movies-by-locations.herokuapp.com/locations?latitude=47.6097&longitude=-122.3331


## Website Client

You can find a website application consuming the APIs on:
http://movies-by-locations.herokuapp.com/

The website supports a movie search and instant results updates on the map for the locations that match the search criteria.  

Have fun using the website and try the following:

* Find all the movies that's been filmed at Alcatraz?
* Find where the Godzilla went in SF?
* Find where the Steve Jobs movie have been filmed in SF?

## iPhone App Client (Extra Feature)

You can find the iPhone App Client [here](https://github.com/georgeselkhoury/Movie-App) and screenshots [here](https://drive.google.com/a/attendible.com/folderview?id=0ByxU7-D_eJKid0pqVDNsclRKVFE&usp=sharing#)

## Code Review Instructions

Backend:
* [Locations](https://github.com/georgeselkhoury/movies/blob/master/app/controllers/locations_controller.rb) and [Movies](https://github.com/georgeselkhoury/movies/blob/master/app/controllers/movies_controller.rb) controllers
* [Models](https://github.com/georgeselkhoury/movies/tree/master/app/models) to get an understanding of the object relationships
* [Rake task](https://github.com/georgeselkhoury/movies/blob/master/lib/tasks/movies.rake) used to import the data 
 
Website:
* Code located in public folder
* [index.js](https://github.com/georgeselkhoury/movies/blob/master/public/assets/javascripts/index.js) contains all the website functionalities

iPhone App:
* [MapViewController](https://github.com/georgeselkhoury/Movie-App/blob/master/Movie%20App/MapViewController.m) contains all the app functionalities

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

Add more functionalities to the rake task movies:create_movies_database for data imports. Support multiple data sources, checksum between source and destination, retries and multiple runs.


## Dependencies

Backend:
* [Rails](https://github.com/rails/rails)
* [Geocoder](https://github.com/alexreisner/geocoder)

Website Assets:
* Jquery
* Bootstrap
* Google Maps SDK

## More Info

* Full Stack Track (Emphasis on Backend)
* Name: Georges El Khoury
* LinkedIn Profile: https://www.linkedin.com/in/elkhourygeorges

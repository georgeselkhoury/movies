json.extract! location, :id, :address, :latitude, :longitude, :created_at, :updated_at
json.fun_facts  location.fun_facts.blank? ? '' : location.fun_facts

json.movies location.movies do |movie|
  json.id movie.id
  json.title movie.title
  json.release_year  movie.release_year
  json.longitude  location.longitude
end

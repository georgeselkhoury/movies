json.extract! movie, :id, :title, :release_year

unless movie.writer.nil?
  json.extract! movie, :writer
end

unless movie.director.nil?
  json.extract! movie, :director
end

unless movie.distributor.nil?
  json.extract! movie, :distributor
end

unless movie.production_company.nil?
  json.extract! movie, :production_company
end

json.locations movie.locations do |location|
  json.id location.id
  json.address location.address
  json.latitude  location.latitude
  json.longitude  location.longitude
  json.fun_facts  location.fun_facts.blank? ? '' : location.fun_facts
  json.created_at location.created_at
  json.updated_at location.updated_at
end

json.extract! movie, :actors
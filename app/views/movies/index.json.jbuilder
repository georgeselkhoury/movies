json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :release_year, :fun_facts, :writer, :director, :distributor, :production_company, :locations, :actors
  json.url movie_url(movie, format: :json)
end

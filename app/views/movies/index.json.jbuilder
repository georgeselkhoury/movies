json.array!(@movies) do |movie|
  json.partial! movie
  json.url movie_url(movie, format: :json)
end

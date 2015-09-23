json.array!(@locations) do |location|
  json.partial! location
  json.url location_url(location, format: :json)
end

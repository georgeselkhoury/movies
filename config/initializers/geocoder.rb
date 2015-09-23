Geocoder.configure(
   :lookup       => :google,     # name of geocoding service (symbol)
   :use_https    => true,       # use HTTPS for lookup requests? (if supported)
   :api_key      => ENV["GOOGLE_API_KEY"],         # API key for geocoding service
   :bounds       => [[37.386525763431635,-122.93289223632814], [38.038356717396745,-121.83425942382814]]
)

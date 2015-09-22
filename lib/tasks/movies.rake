namespace :movies do

  task :create_movies_database => :environment do

    uri = URI.parse("https://data.sfgov.org/resource/yitu-d5am.json")

    Net::HTTP.start(uri.host, uri.port,
                    :use_ssl => uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new uri

      response = http.request request

      if response.code == '200'

        movies_source = JSON.parse(response.body)

        movies_source.each do |movie_source|
          movie = Movie.new(title: movie_source['title'], release_year: movie_source['release_year'])

          movie.fun_facts = movie_source['fun_facts'] unless movie_source['fun_facts']

          movie.actors.push Actor.find_or_create_by(full_name: movie_source['actor_1']) unless movie_source['actor_1'].blank?
          movie.actors.push Actor.find_or_create_by(full_name: movie_source['actor_2']) unless movie_source['actor_2'].blank?
          movie.actors.push Actor.find_or_create_by(full_name: movie_source['actor_3']) unless movie_source['actor_3'].blank?

          movie.locations.push Location.find_or_create_by(address: movie_source['locations']) unless movie_source['locations'].blank?

          movie.production_company = ProductionCompany.find_or_create_by(name: movie_source['production_company']) unless movie_source['production_company'].blank?
          movie.distributor = Distributor.find_or_create_by(name: movie_source['distributor']) unless movie_source['distributor'].blank?
          movie.director = Director.find_or_create_by(full_name: movie_source['director']) unless movie_source['director'].blank?
          movie.writer = Writer.find_or_create_by(full_name: movie_source['writer']) unless movie_source['writer'].blank?

          puts movie.save
          puts movie

          sleep(0.25)
        end
      end
    end
  end

end
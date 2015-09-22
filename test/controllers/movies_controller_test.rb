require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  setup do
    @movie = movies(:movie_one)
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success

    movies = assigns(:movies)

    assert_not_nil movies
  end

  test "should return all movies" do
    get :index, format: :json
    assert_response :success

    movies = assigns(:movies)

    assert_not_nil movies
    assert_equal(movies.length, 3)
  end


  test "should return all movies that starts with Movie O" do
    get :index, {title: 'Movie O', format: :json}
    assert_response :success

    movies = assigns(:movies)

    assert_not_nil movies
    assert_equal(movies.length, 1)
    assert_equal(movies[0].title, 'Movie One')
  end

  test "should return all movies that starts with movie tw (case insensitive)" do
    get :index, {title: 'movie tw', format: :json}
    assert_response :success

    movies = assigns(:movies)

    assert_not_nil movies
    assert_equal(movies.length, 1)
    assert_equal(movies[0].title, 'Movie Two')

  end

  test "should not return any movie" do
    get :index, {title: 'movie xyz', format: :json}
    assert_response :success

    movies = assigns(:movies)

    assert_not_nil movies
    assert_empty(movies)
  end

  test "should return all movies with actor Actor Two" do
    get :index, {'actor.full_name' => 'Actor Two', format: :json}
    assert_response :success

    movies = assigns(:movies)

    assert_not_nil movies
    assert_equal(movies.length, 2)

    actor_two = actors(:actor_two)

    movies.each do |movie|
      assert_includes(movie.actors, actor_two)
    end
  end

  test "should return all movies with director Director Two" do
    get :index, {'director.full_name' => 'Director Two', format: :json}
    assert_response :success

    movies = assigns(:movies)

    assert_not_nil movies
    assert_equal(movies.length, 2)

    director_two = directors(:director_two)

    movies.each do |movie|
      assert_equal(movie.director, director_two)
    end
  end

  test "should return all movies with distributor Distributor Two" do
    get :index, {'distributor.name' => 'Distributor Two', format: :json}
    assert_response :success

    movies = assigns(:movies)

    assert_not_nil movies
    assert_equal(movies.length, 2)

    distributor_two = distributors(:distributor_two)

    movies.each do |movie|
      assert_equal(movie.distributor, distributor_two)
    end
  end

  test "should return all movies with production company Production Company Two" do
    get :index, {'production_company.name' => 'Production Company Two', format: :json}
    assert_response :success

    movies = assigns(:movies)

    assert_not_nil movies
    assert_equal(movies.length, 2)

    production_company_two = production_companies(:production_company_two)

    movies.each do |movie|
      assert_equal(movie.production_company, production_company_two)
    end
  end

  test "should return all movies with writer Writer Two" do
    get :index, {'writer.full_name' => 'Writer Two', format: :json}
    assert_response :success

    movies = assigns(:movies)

    assert_not_nil movies
    assert_equal(movies.length, 2)

    writer_two = writers(:writer_two)

    movies.each do |movie|
      assert_equal(movie.writer, writer_two)
    end
  end



  test "should show movie" do
    get :show, {id: @movie, format: :json}
    assert_response :success
  end



end

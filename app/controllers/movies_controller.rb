class MoviesController < ApplicationController
  def index

    @movies = Movie.includes(:actors, :director, :distributor, :production_company, :writer, :locations)

    unless params[:title].blank?
      @movies = @movies.where('lower(title) like ?', "%#{params[:title].downcase}%")
    end

    unless params['actor.full_name'].blank?
      @movies = @movies.joins(:actors).where('lower(actors.full_name) like ?', "%#{params['actor.full_name'].downcase}%")
    end

    unless params['director.full_name'].blank?
      @movies = @movies.joins(:director).where('lower(directors.full_name) like ?', "%#{params['director.full_name'].downcase}%")
    end

    unless params['distributor.name'].blank?
      @movies = @movies.joins(:distributor).where('lower(distributors.name) like ?', "%#{params['distributor.name'].downcase}%")
    end

    unless params['production_company.name'].blank?
      @movies = @movies.joins(:production_company).where('lower(production_companies.name) like ?', "%#{params['production_company.name'].downcase}%")
    end

    unless params['writer.full_name'].blank?
      @movies = @movies.joins(:writer).where('lower(writers.full_name) like ?',  "%#{params['writer.full_name'].downcase}%")
    end

  end

  def show
    @movie = Movie.find(params[:id])
  end

end

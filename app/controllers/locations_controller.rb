class LocationsController < ApplicationController
  def index
    @locations = Location.includes(:movies)

    if !params[:latitude].blank? && !params[:longitude].blank?
      latitude = params[:latitude].to_f
      longitude = params[:longitude].to_f
      range = 100
      @locations = @locations.near([latitude, longitude], 20)
    end
  end

  def show
    @location = Location.find(params[:id])
  end
end

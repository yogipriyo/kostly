class PlacesController < ApplicationController
  def index
    @places = Place.all
  end
  
  def new
    @place = Place.new
  end
  
  def create
    @place = Place.new(place_params)

    @place.save

    redirect_to places_url, notice: 'Place created!'
  end
  
  def edit
    @update_place = Place.find(params[:id])
  end
  
  def update
    #place_params itu dari mana ya?
    @update_place = Place.find(params[:id])
    @update_place.update(place_params)
    redirect_to places_index_path, notice: 'Place has been updated!'
  end
  
  def show
    @single_place = Place.find(params[:id])
    #render json: params
    #render json: @single_place
  end
  
  def destroy
    place = Place.find(params[:id])
    place.destroy
    redirect_to places_index_path, notice: 'Place has been deleted!'
  end

  private

  def place_params
    params.require(:place).permit(:name, :description)
  end
end

class PlacesController < ApplicationController
  def index
    @places = Place.all
  end
  
  def new
    @place = Place.new
  end
  
  def create
    @place = Place.new(place_params)

    if @place.save
      redirect_to places_url, notice: 'Place created!'
    else
      render :new
    end
  end
  
  def edit
    @place = Place.find(params[:id])
  end
  
  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      redirect_to places_index_path, notice: 'Place has been updated!'
    else
      render :edit
    end
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

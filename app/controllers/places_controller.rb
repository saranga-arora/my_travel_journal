class PlacesController < ApplicationController
  before_action :set_place, only: %i[show edit update destroy]

  # GET /places
  def index
    @q = Place.ransack(params[:q])
    @places = @q.result(distinct: true).includes(:journal_entries,
                                                 :users).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@places.where.not(location_latitude: nil)) do |place, marker|
      marker.lat place.location_latitude
      marker.lng place.location_longitude
      marker.infowindow "<h5><a href='/places/#{place.id}'>#{place.name}</a></h5><small>#{place.location_formatted_address}</small>"
    end
  end

  # GET /places/1
  def show
    @journal_entry = JournalEntry.new
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit; end

  # POST /places
  def create
    @place = Place.new(place_params)

    if @place.save
      redirect_to @place, notice: "Place was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /places/1
  def update
    if @place.update(place_params)
      redirect_to @place, notice: "Place was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /places/1
  def destroy
    @place.destroy
    redirect_to places_url, notice: "Place was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_place
    @place = Place.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def place_params
    params.require(:place).permit(:name, :location)
  end
end

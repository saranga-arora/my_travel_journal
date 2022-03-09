class Api::V1::PlacesController < Api::V1::GraphitiController
  def index
    places = PlaceResource.all(params)
    respond_with(places)
  end

  def show
    place = PlaceResource.find(params)
    respond_with(place)
  end

  def create
    place = PlaceResource.build(params)

    if place.save
      render jsonapi: place, status: :created
    else
      render jsonapi_errors: place
    end
  end

  def update
    place = PlaceResource.find(params)

    if place.update_attributes
      render jsonapi: place
    else
      render jsonapi_errors: place
    end
  end

  def destroy
    place = PlaceResource.find(params)

    if place.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: place
    end
  end
end

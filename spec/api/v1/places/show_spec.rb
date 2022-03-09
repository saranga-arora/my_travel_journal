require "rails_helper"

RSpec.describe "places#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/places/#{place.id}", params: params
  end

  describe "basic fetch" do
    let!(:place) { create(:place) }

    it "works" do
      expect(PlaceResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("places")
      expect(d.id).to eq(place.id)
    end
  end
end

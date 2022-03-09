require "rails_helper"

RSpec.describe "places#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/places/#{place.id}", payload
  end

  describe "basic update" do
    let!(:place) { create(:place) }

    let(:payload) do
      {
        data: {
          id: place.id.to_s,
          type: "places",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(PlaceResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { place.reload.attributes }
    end
  end
end

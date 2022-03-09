require 'rails_helper'

RSpec.describe "places#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/places/#{place.id}"
  end

  describe 'basic destroy' do
    let!(:place) { create(:place) }

    it 'updates the resource' do
      expect(PlaceResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Place.count }.by(-1)
      expect { place.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

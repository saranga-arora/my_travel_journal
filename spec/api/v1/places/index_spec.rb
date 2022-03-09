require 'rails_helper'

RSpec.describe "places#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/places", params: params
  end

  describe 'basic fetch' do
    let!(:place1) { create(:place) }
    let!(:place2) { create(:place) }

    it 'works' do
      expect(PlaceResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['places'])
      expect(d.map(&:id)).to match_array([place1.id, place2.id])
    end
  end
end

require "rails_helper"

RSpec.describe PlaceResource, type: :resource do
  describe "serialization" do
    let!(:place) { create(:place) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(place.id)
      expect(data.jsonapi_type).to eq("places")
    end
  end

  describe "filtering" do
    let!(:place1) { create(:place) }
    let!(:place2) { create(:place) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: place2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([place2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:place1) { create(:place) }
      let!(:place2) { create(:place) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      place1.id,
                                      place2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      place2.id,
                                      place1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end

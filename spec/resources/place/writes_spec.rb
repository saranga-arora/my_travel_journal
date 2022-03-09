require "rails_helper"

RSpec.describe PlaceResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "places",
          attributes: {},
        },
      }
    end

    let(:instance) do
      PlaceResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Place.count }.by(1)
    end
  end

  describe "updating" do
    let!(:place) { create(:place) }

    let(:payload) do
      {
        data: {
          id: place.id.to_s,
          type: "places",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      PlaceResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { place.reload.updated_at }
      # .and change { place.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:place) { create(:place) }

    let(:instance) do
      PlaceResource.find(id: place.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Place.count }.by(-1)
    end
  end
end

require "rails_helper"

RSpec.describe JournalEntryResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "journal_entries",
          attributes: {},
        },
      }
    end

    let(:instance) do
      JournalEntryResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { JournalEntry.count }.by(1)
    end
  end

  describe "updating" do
    let!(:journal_entry) { create(:journal_entry) }

    let(:payload) do
      {
        data: {
          id: journal_entry.id.to_s,
          type: "journal_entries",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      JournalEntryResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { journal_entry.reload.updated_at }
      # .and change { journal_entry.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:journal_entry) { create(:journal_entry) }

    let(:instance) do
      JournalEntryResource.find(id: journal_entry.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { JournalEntry.count }.by(-1)
    end
  end
end

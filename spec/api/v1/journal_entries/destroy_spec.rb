require "rails_helper"

RSpec.describe "journal_entries#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/journal_entries/#{journal_entry.id}"
  end

  describe "basic destroy" do
    let!(:journal_entry) { create(:journal_entry) }

    it "updates the resource" do
      expect(JournalEntryResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { JournalEntry.count }.by(-1)
      expect { journal_entry.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end

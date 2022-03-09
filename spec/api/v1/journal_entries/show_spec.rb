require "rails_helper"

RSpec.describe "journal_entries#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/journal_entries/#{journal_entry.id}", params: params
  end

  describe "basic fetch" do
    let!(:journal_entry) { create(:journal_entry) }

    it "works" do
      expect(JournalEntryResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("journal_entries")
      expect(d.id).to eq(journal_entry.id)
    end
  end
end

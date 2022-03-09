require 'rails_helper'

RSpec.describe "journal_entries#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/journal_entries", params: params
  end

  describe 'basic fetch' do
    let!(:journal_entry1) { create(:journal_entry) }
    let!(:journal_entry2) { create(:journal_entry) }

    it 'works' do
      expect(JournalEntryResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['journal_entries'])
      expect(d.map(&:id)).to match_array([journal_entry1.id, journal_entry2.id])
    end
  end
end

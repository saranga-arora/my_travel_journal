require 'rails_helper'

RSpec.describe "journal_entries#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/journal_entries/#{journal_entry.id}", payload
  end

  describe 'basic update' do
    let!(:journal_entry) { create(:journal_entry) }

    let(:payload) do
      {
        data: {
          id: journal_entry.id.to_s,
          type: 'journal_entries',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(JournalEntryResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { journal_entry.reload.attributes }
    end
  end
end

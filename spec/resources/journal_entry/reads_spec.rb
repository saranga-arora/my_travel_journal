require 'rails_helper'

RSpec.describe JournalEntryResource, type: :resource do
  describe 'serialization' do
    let!(:journal_entry) { create(:journal_entry) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(journal_entry.id)
      expect(data.jsonapi_type).to eq('journal_entries')
    end
  end

  describe 'filtering' do
    let!(:journal_entry1) { create(:journal_entry) }
    let!(:journal_entry2) { create(:journal_entry) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: journal_entry2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([journal_entry2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:journal_entry1) { create(:journal_entry) }
      let!(:journal_entry2) { create(:journal_entry) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            journal_entry1.id,
            journal_entry2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            journal_entry2.id,
            journal_entry1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

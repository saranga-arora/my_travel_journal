class Api::V1::JournalEntriesController < Api::V1::GraphitiController
  def index
    journal_entries = JournalEntryResource.all(params)
    respond_with(journal_entries)
  end

  def show
    journal_entry = JournalEntryResource.find(params)
    respond_with(journal_entry)
  end

  def create
    journal_entry = JournalEntryResource.build(params)

    if journal_entry.save
      render jsonapi: journal_entry, status: 201
    else
      render jsonapi_errors: journal_entry
    end
  end

  def update
    journal_entry = JournalEntryResource.find(params)

    if journal_entry.update_attributes
      render jsonapi: journal_entry
    else
      render jsonapi_errors: journal_entry
    end
  end

  def destroy
    journal_entry = JournalEntryResource.find(params)

    if journal_entry.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: journal_entry
    end
  end
end

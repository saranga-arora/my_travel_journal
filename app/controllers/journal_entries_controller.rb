class JournalEntriesController < ApplicationController
  before_action :set_journal_entry, only: [:show, :edit, :update, :destroy]

  # GET /journal_entries
  def index
    @journal_entries = JournalEntry.all
  end

  # GET /journal_entries/1
  def show
  end

  # GET /journal_entries/new
  def new
    @journal_entry = JournalEntry.new
  end

  # GET /journal_entries/1/edit
  def edit
  end

  # POST /journal_entries
  def create
    @journal_entry = JournalEntry.new(journal_entry_params)

    if @journal_entry.save
      message = 'JournalEntry was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @journal_entry, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /journal_entries/1
  def update
    if @journal_entry.update(journal_entry_params)
      redirect_to @journal_entry, notice: 'Journal entry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /journal_entries/1
  def destroy
    @journal_entry.destroy
    message = "JournalEntry was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to journal_entries_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal_entry
      @journal_entry = JournalEntry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def journal_entry_params
      params.require(:journal_entry).permit(:user_id, :place_id, :title, :date, :description, :image)
    end
end

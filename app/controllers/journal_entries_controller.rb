class JournalEntriesController < ApplicationController
  before_action :current_user_must_be_journal_entry_user,
                only: %i[edit update destroy]

  before_action :set_journal_entry, only: %i[show edit update destroy]

  def index
    @q = current_user.journal_entries.ransack(params[:q])
    @journal_entries = @q.result(distinct: true).includes(:user,
                                                          :place).page(params[:page]).per(10)
  end

  def show; end

  def new
    @journal_entry = JournalEntry.new
  end

  def edit; end

  def create
    @journal_entry = JournalEntry.new(journal_entry_params)

    if @journal_entry.save
      message = "JournalEntry was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @journal_entry, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @journal_entry.update(journal_entry_params)
      redirect_to @journal_entry,
                  notice: "Journal entry was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @journal_entry.destroy
    message = "JournalEntry was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to journal_entries_url, notice: message
    end
  end

  private

  def current_user_must_be_journal_entry_user
    set_journal_entry
    unless current_user == @journal_entry.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_journal_entry
    @journal_entry = JournalEntry.find(params[:id])
  end

  def journal_entry_params
    params.require(:journal_entry).permit(:user_id, :place_id, :title, :date,
                                          :description, :image)
  end
end

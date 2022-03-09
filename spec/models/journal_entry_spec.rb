require 'rails_helper'

RSpec.describe JournalEntry, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:date) }

    it { should validate_presence_of(:place_id) }

    it { should validate_presence_of(:title) }

    it { should validate_presence_of(:user_id) }

    end
end

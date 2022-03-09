require 'rails_helper'

RSpec.describe Place, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:journal_entries) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:name) }

    it { should validate_presence_of(:name) }

    end
end

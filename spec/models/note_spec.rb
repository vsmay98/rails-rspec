require "rails_helper"

RSpec.describe Note do
  it "delegates name to the user who created it" do
    note = FactoryBot.create(:note)
    expect(note.user_name).to eq "Vishal Jain"
  end

  describe "search message for a term" do

    note1 = FactoryBot.create(:note, message: "First note")
    note2 = FactoryBot.create(:note, message: "Second note")
    note3 = FactoryBot.create(:note, message: "First message")

    it "when a match is found" do
      expect(Note.search('first')).to include(note1, note3)
    end

    it "when no match is found" do
      expect(Note.search('abcd')).to be_empty
    end
  end
end
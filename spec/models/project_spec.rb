require "rails_helper"

RSpec.describe Project do
  it "should validate that :name is unique within the scope of :user_id" do
    project1 = FactoryBot.create(:project)
    project2 = FactoryBot.build(:project, user_id: project1.user_id, name: project1.name)
    project2.valid?
    expect(project2.errors[:name]).to include("has already been taken")
  end

  describe "late status" do
    it "is late when the due date is past today" do
      project = FactoryBot.create(:project, :due_yesterday)
      expect(project.late?).to be true
    end

    it "is on time when the due date is in the future" do
      project = FactoryBot.create(:project, :due_tomorrow)
      expect(project.late?).to be false
    end
  end
end
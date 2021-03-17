require 'rails_helper'

RSpec.describe User do
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "return user's full name" do
    user = FactoryBot.create(:user)
    expect(user.name).to eq("Vishal Jain")
  end
end
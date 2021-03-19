require "rails_helper"

RSpec.describe ProjectsController do
  describe "as an authenticated user" do
    before :each do
      @user = FactoryBot.create(:user)
      sign_in @user
      @project = FactoryBot.create(:project, owner: @user)
    end

    describe "#index" do
      it "responds successfully" do
        get :index
        expect(response).to have_http_status "200"
      end
    end

    describe "#create" do
      context "with valid attributes" do
        it "creates a project" do
          # post :create, params: {project: FactoryBot.attributes_for(:project)}
          # expect(@user.projects.count).to eq 1
          expect {
            post :create, params: { project: FactoryBot.attributes_for(:project) }
          }.to change(@user.projects, :count).by(1)
        end
      end

      context "with invalid attributes" do
        it "does not create a project" do
          # post :create, params: {project: FactoryBot.attributes_for(:project, name: nil)}
          # expect(@user.projects.count).to eq 0
          expect {
            post :create, params: { project: FactoryBot.attributes_for(:project, name: nil) }
          }.to_not change(@user.projects, :count)
        end
      end
    end

    describe "#show" do

      it "responds successfully" do
        get :show, params: {id: @project.id}
        expect(response).to be_success
      end
    end

    describe "#update" do

      it "with valid attribute" do
        new_params = FactoryBot.attributes_for(:project, name: "New name")
        patch :update, params: {id: @project.id, project: new_params}
        expect(@project.reload.name).to eq "New name"
      end

      it "with invalid attribute" do
        prev_name = @project.name
        new_params = FactoryBot.attributes_for(:project, name: nil)
        patch :update, params: {id: @project.id, project: new_params}
        expect(@project.reload.name).to eq prev_name
      end
    end

    describe "#destroy" do
      it "delete the project" do
        expect{delete :destroy, params: {id: @project.id}}.to change(@user.projects, :count).by(-1)
      end
    end
  end
end
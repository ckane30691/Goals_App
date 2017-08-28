require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    it "validates the presence of the user's username and password" do
      post :create, params: { user: { username: "Jack", password: "" } }
      expect(response).to render_template("new")
      expect(flash[:errors]).to be_present
    end

    it "validates that the password is at least 6 characters long" do
      post :create, params: { user: { username: "Jack", password: "short" } }
      expect(response).to render_template("new")
      expect(flash[:errors]).to be_present
    end

    context "with valid params" do
      it "redirects user to goals index page on success" do
        post :create, params: { user: { username: "Jack", password: "password" } }
        expect(response).to redirect_to(goals_url)
      end
    end
  end
end

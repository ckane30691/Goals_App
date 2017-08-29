require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  describe "POST #create" do
    it "requires a user to be logged in to create a goal"

    context "with valid params" do
      it "redirects to the goal show page on success"
    end

    context "with invalid params" do
      it "flashes the errors to the user and rerenders the new page"
    end
  end

  describe "GET #index" do
    it "renders the index page"
  end

  describe "DELETE #destroy" do
    it "requires a user to be logged in to delete a goal"

    it "allows users delete goals that belong to them"
  end

  describe "GET #new" do
    it "renders the new goals page"
  end

  describe "PATCH #update" do
    it "requires a login"

    context "with valid params" do
      it "redirects to the goals show url"
    end

    context "with invalid params" do
      it "flashes the errors and rerenders the edit page"
    end
  end

  describe "GET #show" do
    it "renders the show page"
  end
end

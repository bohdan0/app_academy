require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders the new user sign up page" do
      get :new
      expect(response).to render_template("new")
    end

  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's username and password" do
        post :create, user: {username: "", password: "password"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end

      it "validates that password is at least 6 characters" do
        post :create, user: {username: "chuck_norris", password: "a"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects user to another (yet undetermined) page" do
        post :create, user: {username: "chuck_norris", password: "password"}
        expect(flash[:errors]).to_not be_present
      end
    end
  end

  describe "GET #show" do
    context "viewing user's own page" do
      it "shows a user's private and public goals"
    end

    context "viewing other user's page" do
      it "only shows a user's public goals"
    end
  end
end

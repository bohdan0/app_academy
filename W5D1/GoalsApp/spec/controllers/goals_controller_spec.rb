require 'rails_helper'
require 'spec_helper'

RSpec.describe GoalsController, type: :controller do

  # subject(:user) do
  #   FactoryGirl.create(:user,
  #     username: 'user1',
  #     password: 'password')
  # end

    let!(:user) {User.create(username: "user1", password: "password")}
    before(:each) do
      allow(controller).to receive(:current_user) { user }
    end
    # visit new_session_url
    # fill_in 'Username', :with => "user1"
    # fill_in 'Password', :with => "password"
    # click_on "Sign In"
  # end

  describe "GET #new" do
    it "renders the goal submission form" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "redirects to the user's page" do
        post :create, goal: {title: "test", body: "hello there"}
        expect(response).to redirect_to user_url(user)
      end
    end

    # context "with invalid params" do
    #   it "renders a new submission form"
    # end
  end
  #
  # describe "DELETE #destroy" do
  #   it "deletes goal from user's own page"
  #   it "disallows users from deleting other users' goals"
  # end
  #
  # describe "GET #edit" do
  #   it "renders the goal edit form with prefilled data"
  #   it "disallows users from editing other users' goals"
  # end
  #
  # describe "PATCH #update"
  #   context "with valid params" do
  #     it "updates user's goal with new data"
  #   end
  #
  #   context "with invalid params" do
  #     it "does not update user's goal"
  #   end
  #
  # describe "GET #show" do
  #   it "shows the goal's title, description and completion status"
  # end


end

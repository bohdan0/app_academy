require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryGirl.build(:user,
      username: 'user1',
      password: 'password')
  end
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  it { should have_many(:goals)}

  describe "#password=" do
    it "sets up password digest for given user password" do
      expect(user.password_digest).to_not be(nil)
    end

  end

  describe "#is_password?" do
    it "returns true if password is correct" do
      expect(user.is_password?("password")).to be(true)
    end

    it "returns false if password is incorrect" do
      expect(user.is_password?("passworddd")).to be(false)
    end
  end

  describe "#reset_session_token" do
    it "resets the session token for existing user" do
      session1 = user.session_token
      user.reset_session_token
      expect(user.session_token).to_not eq(session1)
    end
  end

  describe "::find_by_credentials" do
    before { user.save! }

    it "finds a user based on username and password" do
      expect(User.find_by_credentials("user1", "password")).to eq(user)
    end

    it "can't find user with nonexisting username" do
      expect(User.find_by_credentials("user3", "password")).to be(nil)
    end

    it "can't find user with existing username and invalid password" do
      expect(User.find_by_credentials("user1", "passworddddd")).to_not eq(user)
    end

  end
end

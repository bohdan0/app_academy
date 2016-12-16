require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  it { should have_many(:posts) }
  it { should have_many(:comments) }
end

describe "::find_by_credentials" do
  it "finds user with right email and password" do
    user1 = User.create(username: 'bob', email: 'bob@rob.com', password: 'hunter12')
    expect(User.find_by_credentials('bob@rob.com', 'hunter12')).to eq(user1)
  end

  it "can't find user with wrong email" do
    user1 = User.create(username: 'bob', email: 'bob@rob.com', password: 'hunter12')
    expect(User.find_by_credentials('bob', 'hunter12')).not_to eq(user1)
  end

  it "can't find user with wrong password" do
    user1 = User.create(username: 'bob', email: 'bob@rob.com', password: 'hunter12')
    expect(User.find_by_credentials('bob@rob.com', 'hunter10')).not_to eq(user1)
  end
end

describe "#is_password?" do
  it "return true if password is right" do
    user1 = User.create(username: 'bob', email: 'bob@rob.com', password: 'hunter12')
    expect(user1.is_password?('hunter12')).to be_truthy
  end

  it "return false if password is not right" do
    user1 = User.create(username: 'bob', email: 'bob@rob.com', password: 'hunter12')
    expect(user1.is_password?('password123')).to be_falsey
  end
end

describe "#reset_session_token" do
  it "resets session token for user" do
    user1 = User.create(username: 'bob', email: 'bob@rob.com', password: 'hunter12')
    session_token_before = user1.session_token
    expect(user1.reset_session_token).not_to eq(session_token_before)
  end
end

# == Schema Information
#
# Table name: multi_sessions
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  session_token :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class MultiSessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

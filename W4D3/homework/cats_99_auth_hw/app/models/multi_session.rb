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

class MultiSession < ActiveRecord::Base
  belongs_to :user
end

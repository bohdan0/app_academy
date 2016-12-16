class Goal < ActiveRecord::Base
  validates :title, :body, :author, presence: true

  belongs_to :author,
  foreign_key: :user_id,
  class_name: "User"

  include Commentable
end

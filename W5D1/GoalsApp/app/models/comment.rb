class Comment < ActiveRecord::Base
  validates :body, :author, :commentable, presence: true

  belongs_to :commentable, polymorphic: true

  belongs_to :author,
  foreign_key: :author_id,
  primary_key: :id,
  class_name: "User"
end

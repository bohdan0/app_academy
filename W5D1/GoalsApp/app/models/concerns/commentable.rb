module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :commentable
    has_many :commenters, through: :comments, source: :author
  end
end

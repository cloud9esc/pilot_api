class Comment < ApplicationRecord
  belongs_to :review
  # validation
  validates_presence_of :commenter

  include Discard::Model
  scope :kept, -> { undiscarded.joins(:review).merge(Review.kept) }

  def kept?
    undiscarded? && post.kept?
  end
end
